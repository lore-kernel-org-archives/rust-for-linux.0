Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2027.outbound.protection.outlook.com [40.92.20.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346E145B10
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727383856; cv=fail; b=L7OSAuXyOIY8u/HPlHfdJhGwKYo+PhGzjvdaC/jBeBN+GthjKWy69gjSSGyRuDsDdpU0lLfokmS2oKLTxOl93KR08GqUxyTHY8xqNBAUPJZ0oNxhNkR97KepLyWrM0Itc6tXolgdOqeHEsSHBt1afE0vQzb7LJ7YJgPGhGQDvYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727383856; c=relaxed/simple;
	bh=qJ/623zkti1LH3I1er2L50TzQaZouxTgeosD9tKhAWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LDq49FI9bBrr8A+ZbuNNnhhgZGs3WSFIvXE5GqCBFtf8t+4c1kEKy9X0hCB/8m+Zv580NTIoFXp4mk2lqOy47f2jnfcX4puHRlhIpm4KUifFdq/IzO18Vajz4FAqB1PSlCdOBg/sHs3j7Zww2axpmP4wi+tQLoPIoGfZhm3uutg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=u5KzE5x9; arc=fail smtp.client-ip=40.92.20.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="u5KzE5x9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYqsMr5JWu+JMh6C2jF93f3DGQKXO9HSRdi1joec2MnHgBBXH9VRl/ImkOgu7A/NyrX8VfMm0QBfQGANlfGsIUNRbCEfd1Dp+KQ1BHq3DeXJXqWauLAg4LiUzmgBNsPVMDsazHaVKEJJDQ7VoUjeKjzPM/tqJUzkHPYWN83b2yLdhxV5k1HJJihE26CjpOTfmxkQTCjt30ImY205rwgLBEGSE1j5m/BZhc6CDKUxiUhV1LzBcei+BMBNqUCPxA2eyGKaYNACSNODDyvkpl8YqfU6tRUBA/9UjvK4HIvcLTGWmxmUrRURQ+m7fo67cUakp3vKNNPc2XUy9g6qXYcQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBbYtb8SAdlhkpXfM/SdFNQSS8InaVvB2Sf8rT3bS94=;
 b=VaYXC/ZxuA6/MZpqxypFc/mdwwMqUgxUQexhR1R8sLKGtu8Z9WrDedJhc0kKzL3PVc7f5WkYfrxlSHRQKhhQyNvDRwE4Rk3iITWR2QKs8gGnVv0Tn4sqtylzxpSKLdletKY+1PU35AKLadKzAgmSfx6qMfAiLRX3rerzV2Tg8t34DFnR1jifGjSvuk+brs2+/GbrK8K1CN8PY1KhkG7OlyYs21hJcSnFMdRMESFuEodrP5cl2hydyLjQjET4jAhPJigFXIGGLcbJM5bkwPmA+i5tP7/Yry/ahf4d3GzwKHtm8iSOJBNpBwRNTVQDtcjAYLfaeje+4Di5GApesBiq4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBbYtb8SAdlhkpXfM/SdFNQSS8InaVvB2Sf8rT3bS94=;
 b=u5KzE5x9TyCzeCdbCHSP6SxMQd4BWYDO9KPg0pTtreqXKCx4JapdBkexGkU+Ow9s6jrW93EM42R8O35Q8B7h2OjGCrw4YRE3TqSy7jhtk2A+quDVbOUWeYBLHhLHGtYdSsgwQ3DfyXX+4PIXVsqWQ58uOofEMKBLIc35KzhNatOqcOhz+1tU1mkKUG8FEjLt9bz6KcZ3AJxGEKCBnYlRuUeOt5NRCkV7c9izILLILob3Q30wBcLr7rSj9erdXeaCqiAKo9cLQj0Gt7gozQbsDcvCIc3e9H0l6KeSOeRKxVH1e3wCH2DO1YZHzGt6fCNf3ELkpGFdf4L0Hcw36sKx5A==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by BN0PR02MB7950.namprd02.prod.outlook.com (2603:10b6:408:168::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Thu, 26 Sep
 2024 20:50:51 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%5]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 20:50:51 +0000
From: Filipe Xavier <felipe_life@live.com>
To: aliceryhl@google.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	benno.lossin@proton.me,
	will@kernel.org,
	longman@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH v3] rust: add trylock method support for lock backend
Date: Thu, 26 Sep 2024 17:50:37 -0300
Message-ID:
 <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP3P284CA0075.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6e::20) To BL0PR02MB4914.namprd02.prod.outlook.com
 (2603:10b6:208:53::23)
X-Microsoft-Original-Message-ID: <20240926205037.10460-1-felipe_life@live.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR02MB4914:EE_|BN0PR02MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2e8e9c-f04f-4c5c-c593-08dcde6ce7eb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|461199028|5062599005|8060799006|15080799006|19110799003|7092599003|10035399004|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R5HkfN7fyMFgeSKE+Wk2s/LuffeU4lZDK3s5EXC47fGUaONeexEXzKqxsloC?=
 =?us-ascii?Q?hBS7OucG8XrzAgAmY513sC+wt6MEgHbfHDbvCd0gEsEI5poEk/TgOzmBes4M?=
 =?us-ascii?Q?cXGkrlxFM7J5tZ0xx1x8yLAh8d0a4GeHmd8v8miHr9nKJ4WjvQ4d1vpuM+Vw?=
 =?us-ascii?Q?1vvTaEZX6xa8hFxvdcSf4DT5WlzKZxlCXL3l/Y1H01vjgvV5lTx4pfBp6zV0?=
 =?us-ascii?Q?oI8zzRTDz2uCq9o/zet05RbwzbJFKrbzhgKFpCIDChcXKyEuF/6W+O0EJWDj?=
 =?us-ascii?Q?AnANmark786GbtqN09dsn+SZ3+qlF7pZ6ltsFsJiedYWND7qJgKVoEFKO/rA?=
 =?us-ascii?Q?EajhCMTButVMRSUetjiQ7Sg8JWRbMcqRg1fYDbM/E1Y8QNyq2MrnIcBN/RWY?=
 =?us-ascii?Q?PtE5iE6FS+j0FznCtMS5hc9hBoLRB8nL3h2q39B/KqX6IfziNWmgBW9jmmf4?=
 =?us-ascii?Q?frpTH5zN++oP91Yy89kcgyuoKHce7IvUiqJ0xsIXY4qusXZ9iz14KiWmaef8?=
 =?us-ascii?Q?hp8E8rJHtU0aayuGxO4F8jlm3DedQVizNcPf5zXXiOKiZT4cdXqZUE3BHwSh?=
 =?us-ascii?Q?Z07y9Z0sfQOBu7inprQ00PwkptW3u8pqhjp7lVB/BhjB7NU1mF9QT3suqAYY?=
 =?us-ascii?Q?t5H+K6mezqn621UrCbPAmq6MtdSRmFXOqRqjNIXKyaaQfceVpTffNcLlDJGZ?=
 =?us-ascii?Q?V6IqzT/pNznerIHR9Ihn91lGMg/YkSfkgJADoFcDrBmB6vwe2u+s4BeqljzK?=
 =?us-ascii?Q?3t+8qrrjnYvG/9nfsy3Bh0iePvMTHfJszCoEXYBhZVoj1CIW6OGeottP+cdu?=
 =?us-ascii?Q?r6cljUp5dUbvJhqD2/7g9f7HWiRROJJUH4E0s+O+aQSbHIxBXSec/XRLpAJt?=
 =?us-ascii?Q?86g8ZMWsM8o4wug+0EdBON/exN0iGsrI6xcOxCaGO9j5g9HrQOqL1aMh4ALC?=
 =?us-ascii?Q?FpfEYJYMK6jTCodL3ZWRcAhsd9T0jmXa0suWLCFDP8A=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BEbhe2AZdqm8zF6YbQxQg45FefstB2cRt4Ih/a96S9xmRB6Myb69PT+ZV/yb?=
 =?us-ascii?Q?m3cgC2vjukeTJHaBGvsO2J7gy1JL5O27O62MFYYdFTdzBePQpDj1igEJ8z8a?=
 =?us-ascii?Q?BMOOd6kZ+c2RFN9d8kFurpqVNFpzle/xI0KXataDIstqsrvPy8IiH/NnRqDt?=
 =?us-ascii?Q?GZoSxJntcvaqZndqAi2UHVE/5ar80DGUZcGIz3J0kqxrrTrU7wHshoEwx6Wo?=
 =?us-ascii?Q?GJFei9SjXFmPRgOh0hPkEdR4DfH8MkiJH29Xjizif9Vnx+fB6dHdDBOI8Jm4?=
 =?us-ascii?Q?gz5r8hLXPHhZAb6pnYK/12hCQwfKQLV5kug4A8qJzLco8GcWlA2+RLCW4B+G?=
 =?us-ascii?Q?M9+vEbDxEun6dH0m3sUbBVg/aGnMbCx6W5nvgVHtDoUg71n5jtYphO9wRm37?=
 =?us-ascii?Q?FCtqgJ6B1Um6+0/aJUzer9t6k6WLAl6Uvi9KbW41Dx8crG0ABeCbI3HuIF5P?=
 =?us-ascii?Q?p5FKIvclhgxABX3mgr9ifG3ik7O5j/q1cImM6xzl7cGXlLUqNwFgQCPjX3gu?=
 =?us-ascii?Q?WMNx2k8VovritSZrnZlG5r6b2Ya7FjavQLg4Y5BudRyGDCDH97yS3EXbYr2m?=
 =?us-ascii?Q?/0DbUQtzpC79cTcclIwpx97n2mgDRbkPE9IPzi3kd4qSVAw4A6NKuA0aMRxK?=
 =?us-ascii?Q?snhYHVuYIwv1LdUYgcgoIxTMFGoDK86hfuaV9plt+asEbtgbc1lAqhL1liSg?=
 =?us-ascii?Q?WuHCPGGQ4ynXUU+aUOw4u0U+1rJwxnuwxzRzyY5P0pniCnlg3bQWNkbtnFLP?=
 =?us-ascii?Q?ekSR4rNcfi31S/sbf+Zy1ulg8qjySteqFpA0FHSd2uGxYhChmkuWCEt2fzwM?=
 =?us-ascii?Q?mJFlMMWM+sNJqj7LYveXCZPH4BC1QhYlst8pMOQWhnjoidINxtio3wqUktdZ?=
 =?us-ascii?Q?RCY5zDr6bAipTFbkPrI/hq41W7Fskirl0PzBO2EKFeD1qbOeyghf1ZhA99tf?=
 =?us-ascii?Q?0KGOrzAmWs6V1Sd8SBdhhCPE7L+fgSkk+imSXFokCYGvf6mbNvx9pqlGYTjp?=
 =?us-ascii?Q?1AbDD9bOuH8oVQl00OOrH3pXm6/1stce9rxqJO36OUioJT6AvFoJF2Od1NAT?=
 =?us-ascii?Q?O/VXcb+lY8qJ9LvYG+bJEe3hvP10UlJeZNt2/dVxwkdf+2MQguk9Ddvw6Dnf?=
 =?us-ascii?Q?vSLEbKzYtjjYyxucAuN2yiwF+fAG7FjBka5xUE1nGvrsbO45qHsqnEHhJm3d?=
 =?us-ascii?Q?1OBdAHhrMrCQpM7+XRwwVDoLXCsrGrRNKsS3pUYmIWywTsGSZSA2uCdN9tQt?=
 =?us-ascii?Q?Aes3wppVLkKMqDddPlbMWTIrGNpi/sdikTjMar+VJsy6cdCJSHNMmz8Rj1NA?=
 =?us-ascii?Q?ix4=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-0f88b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2e8e9c-f04f-4c5c-c593-08dcde6ce7eb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4914.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 20:50:51.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7950

Add a non-blocking trylock method to lock backend interface, mutex
and spinlock implementations. It includes a C helper for spin_trylock.
Rust Binder will use this method together with the new shrinker abstractions
to avoid deadlocks in the memory shrinker.

Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@google.com
Signed-off-by: Filipe Xavier <felipe_life@live.com>
---
 rust/helpers/spinlock.c           |  5 +++++
 rust/kernel/sync/lock.rs          | 16 ++++++++++++++++
 rust/kernel/sync/lock/mutex.rs    | 11 +++++++++++
 rust/kernel/sync/lock/spinlock.rs | 11 +++++++++++
 4 files changed, 43 insertions(+)

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
index f6c34ca4d819..f4e51a5a1f23 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -58,6 +58,13 @@ unsafe fn init(
     #[must_use]
     unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState;
 
+    /// Tries to acquire the lock.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that [`Backend::init`] has been previously called.
+    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState>;
+
     /// Releases the lock, giving up its ownership.
     ///
     /// # Safety
@@ -128,6 +135,15 @@ pub fn lock(&self) -> Guard<'_, T, B> {
         // SAFETY: The lock was just acquired.
         unsafe { Guard::new(self, state) }
     }
+
+    /// Tries to acquire the lock.
+    ///
+    /// Returns a guard that can be used to access the data protected by the lock if successful.
+    pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
+        // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
+        // that `init` was called.
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

