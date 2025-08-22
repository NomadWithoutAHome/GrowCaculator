#!/usr/bin/env python3
"""
Test script for the shared results database functionality.
"""
import sys
from pathlib import Path

# Add the Website directory to the Python path
sys.path.insert(0, str(Path(__file__).parent))

from services.shared_results_service import shared_results_service
from datetime import datetime, timedelta
import json


def test_database():
    """Test the database functionality."""
    print("🧪 Testing Shared Results Database...")
    
    # Test 1: Create a shared result
    print("\n1. Testing create_shared_result...")
    test_data = {
        'share_id': 'test_share_123',
        'plant': 'Carrot',
        'variant': 'Normal',
        'mutations': ['Shocked', 'Celestial'],
        'weight': 0.25,
        'amount': 1,
        'result_value': '🌿 ≈$18',
        'final_sheckles': '18.00',
        'total_value': '💰 $18',
        'total_multiplier': 'x1.50',
        'mutation_breakdown': 'Mutations: Shocked, Celestial',
        'weight_min': '0.17',
        'weight_max': '0.38',
        'timestamp': datetime.utcnow().isoformat(),
        'expires': (datetime.utcnow() + timedelta(hours=24)).isoformat()
    }
    
    success = shared_results_service.create_shared_result(test_data)
    print(f"   Create result: {'✅ SUCCESS' if success else '❌ FAILED'}")
    
    # Test 2: Retrieve the shared result
    print("\n2. Testing get_shared_result...")
    retrieved_data = shared_results_service.get_shared_result('test_share_123')
    if retrieved_data:
        print("   ✅ Retrieved data successfully")
        print(f"   Plant: {retrieved_data['plant']}")
        print(f"   Mutations: {retrieved_data['mutations']}")
    else:
        print("   ❌ Failed to retrieve data")
    
    # Test 3: Get database stats
    print("\n3. Testing get_database_stats...")
    stats = shared_results_service.get_database_stats()
    print(f"   Total: {stats['total_count']}")
    print(f"   Active: {stats['active_count']}")
    print(f"   Expired: {stats['expired_count']}")
    
    # Test 4: Clean up test data
    print("\n4. Testing delete_shared_result...")
    delete_success = shared_results_service.delete_shared_result('test_share_123')
    print(f"   Delete result: {'✅ SUCCESS' if delete_success else '❌ FAILED'}")
    
    # Test 5: Verify deletion
    print("\n5. Verifying deletion...")
    deleted_data = shared_results_service.get_shared_result('test_share_123')
    if not deleted_data:
        print("   ✅ Data successfully deleted")
    else:
        print("   ❌ Data still exists after deletion")
    
    # Final stats
    print("\n6. Final database stats...")
    final_stats = shared_results_service.get_database_stats()
    print(f"   Total: {final_stats['total_count']}")
    print(f"   Active: {final_stats['active_count']}")
    print(f"   Expired: {final_stats['expired_count']}")
    
    print("\n🎉 Database test completed!")


if __name__ == "__main__":
    test_database()
