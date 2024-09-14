Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2083.outbound.protection.outlook.com [40.92.18.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D61CF5DF
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Sep 2024 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726322478; cv=fail; b=Hxu5+HTuE6Q8tzoq5FzokSDeH8wljy/MKNvW5FdqtGYsTSiaOGE05YtEf7L2gqHeBBMxR7c1o+Sngf1xFLdG0HdF0CzPq3EWespBgOy+huMi3yO29oNqz6+MdFYBhuZxq1Db44sfvY0A0WRCTf6rotQqnOuL4B31/kyLYB5P37A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726322478; c=relaxed/simple;
	bh=Z/d7iQY2ImFY0VpSGyZA+Qi7uHwtBki9HfTs/X3bYPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hubsmSGbdGnqUkCHzHyeItqayOekSKNZlWfE55VB4JRo/1p3sn+27WIDHq4DOAuLXvpqyJN/3X/UXI99OgRKb2dDmxghm7Ctr/6X4MUVo+3zUNhmuUJlbnc4bcDPSY31eDwrkTiinLfqWrpbhiWfx5FjbOaMaMGbIQJvykcStgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=kCLPLS86; arc=fail smtp.client-ip=40.92.18.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="kCLPLS86"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiOhjw+pYT45MJ8Khr/XaZbuRk1d5LYw+uP5k4La0y1Eb97VJVdySXQbHaZyCiWBnvS0owGPID51cQOGgtQZBL9uIiqgelCOAUDgJJ6XeWHAysQBSQXObD901616bPLbfAEgYZKQwNz5RBn57cIantblxytlBFCeyrF07KhobT94NmUmKcsQP5IWVDXqCrnmrksc7Yyv21ZY/29w4SREWHtaaUp771kxja5T8hPBQUb9tLTHU7XR5I0EsD2OLbr3ZHbhlqmxRCrK2yeG2ZjUfjEcMFvpTownfxDw0ry5GER+L7dfU0yzl5Z7wICTeH1HC6vMnTWF6bJSuyXO4aflFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc0xPpdsLiyH1fzkWkchd5P1YPaXNvLn1KUzYIdM8NE=;
 b=luc6Pq1BABUkl03Ax8X515J4BJjt7grivStPGcdrHcoxKEjwsoOkO2++ums4ebz+R4QcZnf1l9Vg/Wg+r4L0fWVEVgUz7tbzoY/tvA+jnp90wCv1jZek5/7EjJkMzmvKv9SRP73TRYCPEV8wudbzB1aT2WQQhRyYnIFFDd2QrrwUjmelzkF3kgIBXIvd6G+MSakzqM+V8K5vhXLbpYWGRy6fKAlDRqPiu2VMjepxxgG2JZQ1B2hpgC2YxfvOnWle/j634Him2lqDDTKwm9YXTkU/sP8FQubVMg9xyqx7VrureHvOiPHD8xddPAIBiMYvOYRv8cx3n8RsRNUALXfqpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc0xPpdsLiyH1fzkWkchd5P1YPaXNvLn1KUzYIdM8NE=;
 b=kCLPLS86WVHySell0oSUV1WMMu58C2vJbnx1022AIQvu7KewMbLM+ry/rIzwcmUz98NlqWvw6nZZfRosGXpyb6weQgdvKfkMjtLMHphz2rBeD+knrhRmJD1zzD0DpRxFU6hQDkpMOA8ElKGDN9UgUooGM87EXett9GIzzy/KsUzC09cvu4sRWeveo/tHyJ66+mDSQy5zohUEOrIQB3A1icQ8NdB4F5yYm78fBq6vCip29jkftA/CC1okKEAa1SiW5EPMZnMRu8hsT+pG/ZS3nSWG2ftysBWz1Zu6K1oJsO8o4qicxbYPoXspvCkn8DmLiYcpXt3+MeJZNlytXTLTSA==
Received: from DM4PR14MB7276.namprd14.prod.outlook.com (2603:10b6:8:186::13)
 by IA1PR14MB7295.namprd14.prod.outlook.com (2603:10b6:208:456::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sat, 14 Sep
 2024 14:01:13 +0000
Received: from DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d]) by DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d%4]) with mapi id 15.20.7962.021; Sat, 14 Sep 2024
 14:01:12 +0000
From: Filipe Xavier <felipe_life@live.com>
To: aliceryhl@google.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	benno.lossin@proton.me
Cc: rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH] rust: add trylock method support for lock backend
Date: Sat, 14 Sep 2024 11:00:33 -0300
Message-ID:
 <DM4PR14MB727606461A9C870981F44D9BE9662@DM4PR14MB7276.namprd14.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP3P284CA0096.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6f::11) To DM4PR14MB7276.namprd14.prod.outlook.com
 (2603:10b6:8:186::13)
X-Microsoft-Original-Message-ID:
 <20240914140033.127848-1-felipe_life@live.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR14MB7276:EE_|IA1PR14MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce7cbd4-2fa8-49ca-bb17-08dcd4c5b0c1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|8060799006|19110799003|7092599003|5062599005|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	YXZ6HDHtTJy8wF/6cwg48s21c64/DgqV78ymWnlh6OVg5gRR8zdnvL2zDT6chorhkNWlrc0Gg6avtSb9DPu88NwreEvSvGpObG2JOJnjKCkoceeg+hfbVgj3L52mXBDyfSMKCoT0J5QIpb9iJHq+7BVyRnzKRr5Z8vTvqK/e8cewbz97mIE822mLpgULe4WxaBklZWtEJExtEH21Hj6IokpZC2XcT82SKRlV1UUHNgULjYIlsW41SF5ylvu2NGcsa60zkP6ESnfnxTAf928ykAVET0++O21WRPFkFjjsGFXywmjje0+ZfG5ByXu34kMQPIFd+rXhEvDnNaHsemre/hKm7a0HotgMD/qOlpNVPfy/H66IG5B3SYjxvNYvRBS/GSI8m940NKP2Le+iSgF9EYr0TCgInMq77QCKzTiKh+cP4xxfs5axdTRUn3WATs3IUSG88yWtt1F7wnfF2ZpcMDSMGP8HW6w5x/Kuzm3fF37ZEy4/nHpk3ykBqgcpOoaC/XTwwGd8niH/0lUjUVHnClMM35lXBK3ap1CLZu4cDmauZT//kNFgNJZNStOODXlsc+yBy4VblNjUVUWfJkJCepWXtEZrNFVzepgdk/pBz/E5ps3pOnU7a07Rd8ZdBsoYmjpT7yd6ryZCulbufgievop4DUpOei21uBOJhHdxyGw+gnq+TmC9+JtEHtrrEpVBj/COdY+iUurPte05G7cat6gdEqMTO04YFJPVDGxEhG8Zx2wa8jnrRpA5QvtgMbeenPJlYkpqcnGdMyJUhUiEBbcMHuISwxu72bMS/ezLWoA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XhYnEh9dRX2GlwMxiwA5lw7LtozZ7++rOvXXtIJHCQ54Yxq/DW+4S3e3Md3/?=
 =?us-ascii?Q?/EtUtd9oof3sjtFGxhkHlJQUz8yAuWjlVWtzxgBQbG7ydam2kc8H9Lxh+Qpg?=
 =?us-ascii?Q?Jw1U1jQ299AD3iDeY8Zrq29e63doAxjslIOsyRoOXW8+hP6+DX29zX3DEzF6?=
 =?us-ascii?Q?W1zerrnGkpab1aU806O5jAZ2fZ6DzaR+0knAR3vOTQolekAusg1cE1MBLuM5?=
 =?us-ascii?Q?KsjLSETOYHB6YE9ANwS9XpAmAHvSrgimcp3tjD/9gelJTfkZ/G29cQ7SN1DR?=
 =?us-ascii?Q?Mo9Lpvtq6pWFgO7N4WucjliER2Qn/EDz58ditKvp38xOl/HcAH2vrMsRA5fV?=
 =?us-ascii?Q?/tyQqFz7aic4somhjqoI82vGqpNOg2mVQWAnWLR5vGUv8o4p1DOb9ZdEIZFI?=
 =?us-ascii?Q?zYryAM3UwbfBqUKV5LXIPcpcfBk2vT8ZL5kXlZKdJnGqh2Hv1MoWv2/n3NSI?=
 =?us-ascii?Q?mBjNsoYn8/E5oT1H7n0OBmMWUMcy5ZhmVPv44GL/cYa+P8GqQwTw/kL0H97g?=
 =?us-ascii?Q?NAqxpRMxgPgTg4J/we6MnF9baKCYgfQTv3fUR0Q49RYrgDRfg8ZX74QkcO1h?=
 =?us-ascii?Q?qGfs6Mskc+WSxu0FM4XuQj6DM5fOcSBtF9WVaHbkyEddEij8A4cmwjNqJYVm?=
 =?us-ascii?Q?4MfUkSUy2aK9x7bMW6UMWKfoiJ0jWfM7n/GaXOfYQeNn02zQ0mshra7CJhv0?=
 =?us-ascii?Q?9BbmEkoK9MKQ1N+Yod23BF2eoAcqLN5P3Yw60FN482i6PSGp5EIjMtJB59aK?=
 =?us-ascii?Q?pa2x7DbAYSzgzOnm3gvNXyPPJK+i4so2GKpqyXa3s+RR/Q6RyYUoSDiMiaup?=
 =?us-ascii?Q?/ASpkB5bnuSI8gnQY/H1mSJZqqCXY6LIIIjkKgRZN4t5frSicZgguF+l6vGm?=
 =?us-ascii?Q?ox0bKRN4M2O23JZ7hbc7WIalV4X2DdrSO5MQ2MeQd8Z9FR618LGz4qCXvX98?=
 =?us-ascii?Q?AdHMTee7B8L+Wjb3L/Nr4D1L4cR0YuUhfWXz/uQGI7Ty8ZioIWaUE7EJ67UK?=
 =?us-ascii?Q?z35QBCj64aiuBV6M6wTxrHi3/2WSzikkmN0TGozaYLjyfe9gQSWmvFjjf+QS?=
 =?us-ascii?Q?C8uGVUrHxdNESV9ixjUqcziAycmDLVURCwo/ay1eAO/6qkN++65P8E262wUq?=
 =?us-ascii?Q?4vPtgZr/RWYq8KjTcZPiey3UiwnDznqf3VACy2eshZ+1OzOhDsjRSz63c9pR?=
 =?us-ascii?Q?p1n5vtYiOA/f+i5r385w558KY5UBnZdAX7Vw4W167iS6RfL0XQ6gY6f/rHM9?=
 =?us-ascii?Q?ZyqLL7OhO0gTFTBBoDgosCKHoQjiOMeQMarX8dA6zQ61XouLdszA/hpwnxrx?=
 =?us-ascii?Q?Bl8=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-cd57b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce7cbd4-2fa8-49ca-bb17-08dcd4c5b0c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR14MB7276.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 14:01:12.1770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR14MB7295


Add a non-blocking trylock method to lock backend interface, mutex
and spinlock implementations. It includes a C helper for spin_trylock.


Signed-off-by: Filipe Xavier <felipe_life@live.com>
---
 rust/helpers/spinlock.c           |  5 +++++
 rust/kernel/sync/lock.rs          | 15 +++++++++++++++
 rust/kernel/sync/lock/mutex.rs    | 11 +++++++++++
 rust/kernel/sync/lock/spinlock.rs | 11 +++++++++++
 4 files changed, 42 insertions(+)

diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index acc1376b833c..775ed4d549ae 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -22,3 +22,8 @@ void rust_helper_spin_unlock(spinlock_t *lock)
 {
 	spin_unlock(lock);
 }
+
+int rust_helper_spin_trylock(spinlock_t *lock)
+{
+	return spin_trylock(lock);
+}
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index f6c34ca4d819..c13595a735ae 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -27,6 +27,7 @@
 ///
 /// [`lock`]: Backend::lock
 /// [`unlock`]: Backend::unlock
+/// [`try_lock`]: Backend::try_lock
 /// [`relock`]: Backend::relock
 pub unsafe trait Backend {
     /// The state required by the lock.
@@ -65,6 +66,13 @@ unsafe fn init(
     /// It must only be called by the current owner of the lock.
     unsafe fn unlock(ptr: *mut Self::State, guard_state: &Self::GuardState);
 
+    /// Tries to acquire the mutex without blocking.
+    ///
+    /// # Safety
+    ///
+    /// Returns `Some(state)` if successful, `None` if already locked.
+    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState>;
+
     /// Reacquires the lock, making the caller its owner.
     ///
     /// # Safety
@@ -128,6 +136,13 @@ pub fn lock(&self) -> Guard<'_, T, B> {
         // SAFETY: The lock was just acquired.
         unsafe { Guard::new(self, state) }
     }
+
+    /// Tries to acquire the lock without blocking and returns a guard that can be used
+    /// to access the data protected by the lock if successful.
+    pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
+        // SAFETY: The backend `try_lock` method has been implemented securely.
+        unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(self, state)) }
+    }
 }
 
 /// A lock guard.
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index 30632070ee67..c4f3b6cbfe48 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -115,4 +115,15 @@ unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
         // caller is the owner of the mutex.
         unsafe { bindings::mutex_unlock(ptr) };
     }
+
+    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
+        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
+        let result = unsafe { bindings::mutex_trylock(ptr) };
+
+        if result != 0 {
+            Some(())
+        } else {
+            None
+        }
+    }
 }
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ea5c5bc1ce12..c900ae23db76 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -114,4 +114,15 @@ unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
         // caller is the owner of the spinlock.
         unsafe { bindings::spin_unlock(ptr) }
     }
+
+    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
+        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
+        let result = unsafe { bindings::spin_trylock(ptr) };
+
+        if result != 0 {
+            Some(())
+        } else {
+            None
+        }
+    }
 }
-- 
2.46.0

