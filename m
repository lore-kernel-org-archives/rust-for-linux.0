Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE45F52842B;
	Thu,  1 Oct 2026 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866826; cv=fail; b=kFmBKNOQT77fserciNOKpzib8f5Ju6FeuB0JbF+TjZh1cOVUYKnif+MnOQ5E/KqlMA40d7bxF/3Tlo4N5dkLS0uOJTyoClJk4sg8bbYRMZV+7fHcBM9o0WyaEHigifGyl1CewG2+4llgT5ep7AudRAsI0WopBxfcidk8HvgXLlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866826; c=relaxed/simple;
	bh=28FUYfyr3J12CAvTceHXSGNQ95gRKUw2ZzzkM0HbaYg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IUQBNEM8PNLEQ2wJ99HWgOs3oOYfMz3oghObhQItBwRPwne3uNw0drPM0bDMag5iUu9enuqLp2vgcXtG/O0wLuADWZxsOnO6n/HeWxd1/8GNp9eBtZMVOfd0vk+1j73nTDopsTg9Qu3vO+viJdibbFImo5kY0phMB33B1XlqtDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GhPMoVvh; arc=fail smtp.client-ip=40.93.194.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GhPMoVvh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhIyQedmcwKol/hW2UthyL37cDRciPpCcKYOV+t7nmGYjxveZ1KLPNv0XsbptlgBfilnuyIRgbhDjhtB2Sg9HULeyj7c8VQino0/PRy0RbWeKRkIzVOBm7pzW81n+66eQ1bIeNRO465HqazvTIF+58EhxUA/dC6Gz0bkzzBwEUiVC4HRqC+A0w1T+7gPQTPHOqpxQo2NDI5p7bjqDBJpEEhz3b+c7WKtLE9eRlzZcTzI7Cf9yKzi3t8e/c3fol82/mgHuZWsj4Ff0GjnjGsTjprOoyWTh838/sf5ZhNuMC5jTmcTLVEDlSLKZEif7eDFIWMy+0gsd64F8gnTpXfEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zky9nKm3+jpyfNxOqGdW+YlRSeNLGR9khF8osEoEko0=;
 b=M6SCYQq2/RvfaBxHgeklLG30JRhxWd6BrJD2UX5HBnYU57GoOOXvE+Ta68u4BxU33z+yoUTFV8XWhrVaNo07CuYynhBUdNgcycKYUIzUS6vV9YgjL2kgxwTQD+7/8fHLE4eRD/XTpYEmfDbLOgeCVtuSgBEGG/an71IQo8wsvnh52C/82GEleCnu2z1WMPjtZw6dDQBeqWte77MvRYYTzKijWyQI5tGj8dyZoldZ1oig6aLqdYqCofBmsam5XaTXLXuFMhj9X3TBym0ALH+bLBD266z365XGlkbFyZ0judsEovUH4SGchpQwfqer7BMC+K0fxnMLF3tkgSlQRh1TSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zky9nKm3+jpyfNxOqGdW+YlRSeNLGR9khF8osEoEko0=;
 b=GhPMoVvhuhGdE4N/Ta6xKA7XbAP53F1JeWMkFjITcIKHnrsqYjpAe5EV/9hU38n2LQPFjfOdR3ZZc0l/QaiDd6n4f/Lri978+XYPMR/k0vfdECxEROtHFzidIEuV8kpbkRFM/uuSdcS6DJFUMrYFzPIL4RB5C20RxygtKrnHLKjWLztlJrMxh5pOXCKkWO/9rLHskvnTa9qiADkQZuO3rs4qTNBY6PIx/ZW+qjavt/JbbNyceGnEGPDAa+EXPaU4p2IsS7vdXy0PQ5a+IJe1tVM7DR0VSLhYXeAnsli8b3yfQ+XA7noRjUqeIz3CBofVqe+XKkGeYisbTSELEyin3g==
Received: from SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14)
 by LV1PR12MB094641.namprd12.prod.outlook.com (2603:10b6:408:505::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 15:00:20 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::a7) by SJ0PR05CA0099.outlook.office365.com
 (2603:10b6:a03:334::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 15:00:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 15:00:20 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 08:00:00 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 07:59:59 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 07:59:54 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrewjballance@gmail.com>, <daniel.almeida@collabora.com>,
	<dakr@kernel.org>, <aliceryhl@google.com>, <ojeda@kernel.org>,
	<boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v3 2/5] rust: jump label: add support for nested arguments
Date: Thu, 1 Oct 2026 17:59:37 +0300
Message-ID: <20261001145940.1077801-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001145940.1077801-1-zhiw@nvidia.com>
References: <20261001145940.1077801-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|LV1PR12MB094641:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f01eb6-08ce-4d18-49af-08df1fccb641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|10067099003|56012099006|6133799003|11063799006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8OBS3O1dkXHrBXQvFWM1hxFuzMuld+h+8VSpOg+q2lcd73wb+qe4z/sjKOJgOTnwE2jgkrjqIIyCcH2k8a3lJGEnyxyh4OAF+GbECMRxVVLJ3NwOyWxIahzZpfdER4JNksGeuXS8sxYqe2Qf3vm3/zpls1PbhpfNbJWhszwJe+b1w85FismUpo4uXYQR3RpMKfwRi/F4bwvjSQP68412YLPYkR9FZiqimnIn7IEPpW2xhTwu5KtOj25ScsKiR/dklsXcx8PJi3iwddLMvJjw6FypGBXEvbHcag5fLMqGqaKLPHzIKAsrbqHERxcetzWr7vAUVwUf5klL5SJopW9Hqjgfi4nPy5kupvF3Hy4BfmqHr6oA4iWMhMUjMvyrayGB2fAWO1tLwNpiAPHPFhvtQvQ9K2I5m+pmQup2CZ6guluuMNYkVzgOBnuymZ9n/gm64Tb6Y42bIQKbPhw6lx5yRQ1W4hiMHI13XTz3bKumpyRBg3j7Q+QNQC4FgF0j01Zn0a1yC0Yf4wdQaW79nUJcnFUgnX1BowlfpqRG7itIv2SKjvYNokt4uvp8x9w+pEysgKXz5ifVZFZJtdnXWJH0pPHgm5P8newta22Qgui9E7dmeamktf03ZzoI5c3rTUAXCH3MKMuW/ww9uJlcYcIsS7C9/Vfh61yl/9FwSX3/3xhx3Zv2wNeCe/8HnRTgWHJ5QlSWGjOCbqqJgv4nQmqomw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(11063799006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3yMTqZomQltqzLnT5c6X2Jb4Q6ga+5I/aXgJPQylqFdvJwSziy99MWJumbExPyAngoRanh1ksHswOUp/V3ESp8HyXB7Dm1pTNaRyvtj4sTByfBx9wt92nCKL8tGx63wkrDN0YIUJbNBUML6S7ml9CGQa5ZYfB7AX53JugkLCB4swl+SwEb3A3xXuFeZVLjBtXHU7AJMZcmslV4SkK5UrUv9tWR6PSFnLz3oP+lrSIoBDWjYCJfQKqcAQKXxDDZY68tj9vmqga/YqImhqgQSjXhS648KC+GTaKaBdJsYMC4teyvGzUBMN8YFMZuB+pbwgtqT9I+mJCCSbkRFR7Ptg+J/itNYu1dGU+jAZmSSREbdEc7KViB2LqQ70CDkdWMyg2Wn13VcM10aeoM9Nt60YLB0tn/nl6UoJJWpqBfTO3YsHyKu/cMPjBx1hwvaQLii3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:00:20.1148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f01eb6-08ce-4d18-49af-08df1fccb641
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB094641

From: Andrew Ballance <andrewjballance@gmail.com>

allows for nested arguments to be used with the static_branch macro.
e.g. `outer.inner.key` can now be accessed by the macro

Link: https://lore.kernel.org/rust-for-linux/20250620210533.400889-2-andrewjballance@gmail.com/
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
[Zhi: Rebase; extend the host-test stub in the same way and document
 the initialized-key and storage requirements for Rust-defined callsites.]
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 rust/kernel/jump_label.rs | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index f54cedcb6fd5..9bda169e82cd 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -16,12 +16,15 @@
 ///
 /// # Safety
 ///
-/// The macro must be used with a real static key defined by C.
+/// The static variable must contain an initialized `static_key_false` at the specified field.
+/// Its storage must remain valid while the key is registered with the jump label code. Updates
+/// to the key must use the C static-key APIs.
 #[macro_export]
 macro_rules! static_branch_unlikely {
-    ($key:path, $keytyp:ty, $field:ident) => {{
+    ($key:path, $keytyp:ty, $($field:ident).+) => {{
         let _key: *const $keytyp = ::core::ptr::addr_of!($key);
-        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
+        let _key: *const $crate::bindings::static_key_false =
+            ::core::ptr::addr_of!((*_key)$(.$field)+);
         let _key: *const $crate::bindings::static_key = _key.cast();
 
         #[cfg(not(CONFIG_JUMP_LABEL))]
@@ -30,7 +33,7 @@ macro_rules! static_branch_unlikely {
         }
 
         #[cfg(CONFIG_JUMP_LABEL)]
-        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
+        $crate::jump_label::arch_static_branch! { $key, $keytyp, $($field).+, false }
     }};
 }
 pub use static_branch_unlikely;
@@ -47,14 +50,14 @@ macro_rules! static_branch_unlikely {
 #[cfg(not(testlib))]
 #[cfg(CONFIG_JUMP_LABEL)]
 macro_rules! arch_static_branch {
-    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+    ($key:path, $keytyp:ty, $($field:ident).+, $branch:expr) => {'my_label: {
         $crate::asm!(
             include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_static_branch_asm.rs"));
             l_yes = label {
                 break 'my_label true;
             },
             symb = sym $key,
-            off = const ::core::mem::offset_of!($keytyp, $field),
+            off = const ::core::mem::offset_of!($keytyp, $($field).+),
             branch = const $crate::jump_label::bool_to_int($branch),
         );
 
@@ -67,7 +70,7 @@ macro_rules! arch_static_branch {
 #[cfg(testlib)]
 #[cfg(CONFIG_JUMP_LABEL)]
 macro_rules! arch_static_branch {
-    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {
+    ($key:path, $keytyp:ty, $($field:ident).+, $branch:expr) => {
         // The asm falls through until patched, which never happens on the host.
         false
     };
-- 
2.53.0

