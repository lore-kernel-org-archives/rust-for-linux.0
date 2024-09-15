Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2104.outbound.protection.outlook.com [40.92.22.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616B1C7B70
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.22.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726413864; cv=fail; b=Z3CDKPLuSvBypCr1Y9EUD8IiaplbpPSxPGAMofjzSQ85AzeGmg09fmsNVeYa/mntmtz13x2tVpdBjeLv3lgmf0SzhQnGCPnEiWRtbCax+vF9o9vh07rNpnKTCVm4Nwho7gc4CFofGXvOkP+j/4XlRPneipS+K1zujgadXv5TOlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726413864; c=relaxed/simple;
	bh=YML6Qt+v++WH2ETn/DIyaSMQt6X4tFkTaDP/7aaE6wk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LfYFvrDKUuELjHYQ2JJoHgaNaoCgdNbuHzfYH/uJJfrsefTfYVyWf3vWbU01g7SzMK3NG+9qUmBwmWRTu7p9FMUBqBSEYOQoV1rPqRziEroFjLuaTabNqQRilHElN2kZnusTNI8s9Oka1Mll5YXuwmIS0LMp+QS94OtA7UszXlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=H0EqxqSM; arc=fail smtp.client-ip=40.92.22.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="H0EqxqSM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgdzav4xNJGyeY+OSgVpKcpMmYsZeT03UGcr2GpJBWF+kL/xVccvwJqeXqZqj6rgL7oTElI5d8DQgz6J4MPbJviKrbOXwD+6ryBDnGVAALvNUUvUJuV8oKKc3k/w3wb1CyjXvRQZM5uD0Gd8NMhfEVk2PgGx/3F+PInzQuBmjwSCPw71BqSATZ5Rq295CRYbdItoBVif/kt2Gog1HipBk2zXwZa25j4CB/r9LjK0dcL9gZb/Jsehax6RPHsCRw5KJuDZTzsESUbwSWCf2/7ZL0hPyOK7RJbeDHSQ1qbAqQlwhmHCJu7JmUHDjAnsB2jKyfgtk9064Vydc3QQYrXbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npcNRztkps+1N5wPTdzQLOKNaImp51WH8SjPLuaTTs4=;
 b=LVn0cFZdphBulS/HpM22OymH5xopcr16nHEnBpJMHq/XJht+GK3AByH8t4x+WPF9a1ZBlRudCEujlxch5SI/dQlTtCNTHLy4n0QPNfdto7aM075zG97tKko/8QhWILvtNgl8Tr5vzi9CNARbr5pQW01oOixwQkujbtVWhyCcOF6NL6yFpA6QU9cWNEKJRkEbkleJI/Kw2oI3Fb+3y3ImZJn1QItCIDNW8Buq2mviHnWZYV7mzj8Rnd7u+hVor6MeORilR6NlAQDSq2Z2u4e1nqGl7DC+McnrPRbJS2DWeCmXozoECi/LQC4wxwg/XOKVaIN86Fk21UFvwiItvqwLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npcNRztkps+1N5wPTdzQLOKNaImp51WH8SjPLuaTTs4=;
 b=H0EqxqSMz7CtZCt1VcLthXfwqPNe9D90XBKRI3ctXzurCNrmSkkqW7/SL33pPWZtDzrpBw5jCijgjBetKivR/oBfDsmzHCmUB1r8OVy991+j7saUIzLsLtxig0Lzms9aiaqwhUywJ8gcG3twJUfgOJ/yWNGiF8ZNu6Gm7koE7oTmfUYlcThJ0/Ug037xILDU81yUH9emSpCXGxOVH1WLtNv7H2XLPQjLEdQD1m6vjxOEq0tpG0CVnGhiU0thG5URIzHauWxoVkBlqwanHWzCTUZuXIjtiEKmG/qfxd1p+Z6SFvC/k+ODadNFbNRJhI++SsCK413TNYftzqccnITasw==
Received: from DM4PR14MB7276.namprd14.prod.outlook.com (2603:10b6:8:186::13)
 by IA0PR14MB6885.namprd14.prod.outlook.com (2603:10b6:208:407::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sun, 15 Sep
 2024 15:24:19 +0000
Received: from DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d]) by DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d%4]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 15:24:19 +0000
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
Subject: [PATCH v2] rust: add trylock method support for lock backend
Date: Sun, 15 Sep 2024 12:23:39 -0300
Message-ID:
 <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP6P284CA0057.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1ab::12) To DM4PR14MB7276.namprd14.prod.outlook.com
 (2603:10b6:8:186::13)
X-Microsoft-Original-Message-ID:
 <20240915152339.299491-1-felipe_life@live.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR14MB7276:EE_|IA0PR14MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 52642e07-d759-4786-94d5-08dcd59a77d6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|8060799006|19110799003|7092599003|5062599005|5072599009|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	I1pLHZTQchwNpwTHbF/uLmHYbFUet0PqqtwkCicxVcWhM7/5cxWn+K3EZy2j7aEGyVw+NqST8y+H2bUgYqdisHtc5C17NWUn97kppdr8Hh7iDzKAxWDiwUVytS26qxTRS+t0qGrAr1xKJ8+ALF9rAl+SOX3Rs8Qyspr0VvjCENTLDjSU+QgwZ8cTkDhMsFrlD4875Fbf3iVUJEAWvuCbQxCJup/jU9L6vFMgRSXRMmm5o38gKMwcejVz21NdkSWPLJnj+2D14uCzki3vWZnayvdqND/jczjLCM3PnSNe8kVGqOq5ymQdUgAAmRNcAhfzEq2ikocgNxK7crPTakZWUlckovZAmC5cH/ZD2SKr4Pg2vYhaQ8Fq2Hc2U1Gljb6aQhmIxBKsiO8/1bxDBiLJFlogzsWRWOv48Utdkzuk7l7LrqIUhdF/Kp5qzJJyBes2Ayj+qhrQpsBG1iTgHT5yKCa+sWyaXF5yBNwUUTjwuNAxc5lhN1F3Q8vMmCyIvxtaVryuNnfgWMMv2NWgiqZO3jQb/irS6XpCMLXDIphdrhFOkMvyM571TU/Hj3+PJkX3h05JIHuWodBGNuUfeyg2INuXQWAkZWJmNpvB1TJ8DLaIkmzvWehl6owjowPTrN9H+lFi8CdI9LISsvlvSwBE+O0M9ShW7cC+jZnJJYRsGZjiajJKPqNqgHPg/oylg+Q+zfzGhIjAVsN/oIYbZ4hyzUjjBbJzUATvKt8ViQ/Wo0+rG8YYjJf5HLdycH6zsrcbLCCaZLlU71TlPsbpZJ7NEsqOZNq8XC+0axxDysAxuIB5Ysfiyldg4ofGg1r3aauY1hBaNVwQvPAGxab0c+eAt+e+4o4F1+KviaNav2BLLG1Tp3Jbwb7/c4wZSV+eYTfSE3mqTFaEjj2HDdQ1VUjqFnGoK1F6NjGoiZSle7EMOeUycmCuRCHIJbOEwZk51pGX
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tjFUGETTP03rm9V9wmZJfb0dScdi0+S4AWGaBIocR8IAfW7EM9Dook6nOpvF?=
 =?us-ascii?Q?LnUw0ShCXMDTDQ0hB8r58qsMkvK7iQQUc/vfBpZ02RabIdCQgs/PfMru3wlC?=
 =?us-ascii?Q?pTNigicmNHr0O2+rCdvh2fyiknDj7f8JlLfARZUuRNfNwpb9OI/ngH1a1SjE?=
 =?us-ascii?Q?7g3jyvI+w8RkktTPKgDGyXDOIad1oGbC6hcTfs2kM6QasenExMmcz2L2Gsp/?=
 =?us-ascii?Q?SMPM0csWj2vH1/364HlSIgydOm/U3WYaizAeYqTpYnPTisi8y97SMiPoCb1P?=
 =?us-ascii?Q?1jWL0o5w5b3dCC8OvnEN4OC9G4yCF2xktOdXmpT56NKVQxp+LOIu0/ZSevo+?=
 =?us-ascii?Q?KUnytqSzSRvEr79VRb6rArRXvqE6h38UIo72F362QQXGlQ1fpvsfMLNfiLnf?=
 =?us-ascii?Q?ZmCrDz4pRZDVn2TDZEVSj3d/FGii9eCbBMKUSOF/cFTm3MTpdvUE5oaA2+4X?=
 =?us-ascii?Q?iPXMnKurMzJOf8Z/Z8Un/iaae8tYuCOUjJDdLaj7CJ9za8r4dNr29F1LJqA5?=
 =?us-ascii?Q?IA/Qxqw3vc7DEoRLR16B0I6nRIiKuQan7/3uzlDChn/kqiUIuRrXmHxbvg+S?=
 =?us-ascii?Q?UesheNVoqllafi7JHT5mZhdNfb1YvEN5CKIPWtkcevZECmdaBZp2AhOfSxT9?=
 =?us-ascii?Q?u08BfEIhc0Zte7Y2iHXESFAzGVdKYFLSGwAErNVcJgQcrtrYagFaI0Mxh05i?=
 =?us-ascii?Q?QxC8KDBsxjbTX1vtA/20vPFjTuryJNAQak2DRYiTKsbeV23XVbmlV1Mus3WT?=
 =?us-ascii?Q?26hzfFrsWa7D2anXY9PfRzm5Vs/8ZyZtcr61Aulft1ygo2IjLgar55/WjSaG?=
 =?us-ascii?Q?sWs8jkL6JZmGhFVW2mxz9NkL3DWRm1y4N7h5XbAAmBExtDJd7ZCS1bZ0+6on?=
 =?us-ascii?Q?Q3wfJYbF+fN6IOIBYZ9i/rSmx8uI9XZqgNLsd9AW9+6uoMSulJUvfeaZ7GP4?=
 =?us-ascii?Q?Nv27MGXqVL4pv9rzqrs0rNhLnyuN7+XaPxOg2GGLro4X/f881HKLvrnU0Feh?=
 =?us-ascii?Q?8rKrx72L+WWT9tl3ff4sJmBm3N1ft6UXXYoJUgkE0vc4iXvvr9jvPJ8juKmn?=
 =?us-ascii?Q?vxA3BOyn70+ylaPAoLJ8XDb9QxfWJIPXH2+8y6A4PgTV7swfJtDFpvtm6RRM?=
 =?us-ascii?Q?hcDX4lydkZhGuRVhUo4hxnq5LsH98v0WnoyTYKgENmilIk6f9XFSbh8H8N5v?=
 =?us-ascii?Q?kH/Esk8b5/HmyNqa7lPE8lMHy5D3rZvEs7S2ZTEqxCclBWZgasXqCNpVRP5B?=
 =?us-ascii?Q?WjNnS7Ix1FsVjbPLtdDW2o7ztvVe8QYpaLCLWiRfPMqn+yhKROEag9zvcjQk?=
 =?us-ascii?Q?Uis=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-cd57b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 52642e07-d759-4786-94d5-08dcd59a77d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR14MB7276.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 15:24:19.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR14MB6885

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
 
+    /// Tries to acquire the lock without blocking.
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
+    /// Tries to acquire the lock and returns immediately
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

