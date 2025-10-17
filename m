Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127726F44C
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680117; cv=fail; b=ZJc73Byzrk2F1vfJHooZ2sfUnuFGwYmdh5+7B0KgG/IMXoWbilCoaZ+sfbMsqBd2z5a46yPWtcUkCrLwo4E98TyHlRBb7B5o81tlWT/lytbBfudyf5dLs6LqYH3duzP9KuE7MQshgOgqbCuRFMpgFomOGaiGEnFm4aAeg5J9nrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680117; c=relaxed/simple;
	bh=5jXcxDu6j06Y7OA7bNNflyw6YueMYOkYPoYM/GBHzMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JWGOneaVfXh+RSEqVffceuMnFSV91i0SixW3PzCsPDRg6UeNJ3HYHxmmvSpiB9z+z4YsoUuSRq3G0mh5akacKrEMKmnKr8Xj9x1/FCkGPQxZLP+gcHHdNq6lBssFzE2fZpOyPx6OCaWTQvCdTniyJdmWVsrnfw5VGRtwTsOEoM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a6mtiBeB; arc=fail smtp.client-ip=52.101.56.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a6mtiBeB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSZ5jc5S0KvNxaOO95HzV5C4TgiiMINFDCTigETmLnf7Gkp8aPL80Jsse3XIpobO78oFCj/rEjTehpUKlJLTqDpH1BREAbtwbyi37Ovssh7rdeKqwwJXqPoHVzZaRaseZbkjDXXwAr7hJ74e6inhpP2wF5fclmCkoAh4v9UKdvOY+pIM7m73xrzpVyZmTTQi4pHECZq+5FAj3M4rZa/cSrpU/2ra31NpGw6RDlcyPEbAw5crtETqwhH/lKrKnctd3pCrmDAsYOPhb9BXitnn4XR0fuKv43/vYhPjaj7wgTrlRQ8k0e2zhO4OmuhxvrElINNHGl6R1txSDKy02mCDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YH//zDOnPNDWjR55GYjV0YCDDW6AXQn837vFF70r+2k=;
 b=x/6GlMNFmFRrMXhQAUeie4qmExqsjQYYvkY5sRpKtswb4Wt7kdGNjYxlZnNHZfVUzVO5zIxH9ejtu4A8p0EVObfLIaUeTbsafnJbUR3WaOrYJTPKpEpZQK5AqWzGKTD/pPgRcr6QsnPqeZxPli4VErYjymDKD+zkafbiFSi7ylkkxEYErA9hcsCTQZtlKWeLxbF6LN7Eg31vuitj8RVXYh71ft42LvwKDiSJiOxs/KceE8qPxjGSgowXypxvrfQYGKCtzBajAWupJ0mxKvTUBT+iKYOL2sy85dG73z8gzPkfKSrLOAZbbcsU7F+CC42oQKVwoXMxZ1b2d5CBuIBJSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YH//zDOnPNDWjR55GYjV0YCDDW6AXQn837vFF70r+2k=;
 b=a6mtiBeBbQbhae7q1hhZPJjzujXonrpqCZbcHSRX6iLxO2Sv/BqeI8oXJJ9Uac+IEAqRVnd4elqnn0hIyy9E3/rR9aRFro3pP2Y8r1rAxTJPYOxA5o635YmwgkCoFAQhfGhkBEnmKYLavVPzDhlivf63VKhWW8/0tnxZZ5oNOfIE1vU92/Mr+x5HMvv6B6wtY6iEGLrsxZoYNXS5OcsadsoUgct2QO6hYE3e4h5xKGmhakhzB8PZTLQwU6FkYNcNKuOG5fIm0n835yQ9y9+VBsc85Pig1JlTjMtvSiwTVc/lurBbjo9Oy3o3T1Mht1HSVDZZFY/ERi3hHh571IwLnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:32 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:32 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 09/11] nova-core: falcon: Add support to check if RISC-V is active
Date: Fri, 17 Oct 2025 16:47:34 +1100
Message-ID: <20251017054736.2984332-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0056.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 005291d9-9c67-4567-2fc4-08de0d40cd9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OjS9CYHawFxLQpXjBDr/wH4etEwfrSa2NMypBc/mfU9XqoEzaQ6xAwVjoz7A?=
 =?us-ascii?Q?Fn2OPkZ9Wz1SZRIS/IhcH6OQ7PqF7tAXm12Bl2d+Qf+wS9FBUOJXz4SMARdu?=
 =?us-ascii?Q?ZNm0Dyf7uNuytps+ikFdj0PX8EZMzr32L+hy4E2QFMKbfFFFQV1l/FJpbev3?=
 =?us-ascii?Q?pHAxw3SXsnR2x/8NFdnzvWKDmGbcZzDV4uA2NuAse7XkFNT1/OzbdzsMw3nV?=
 =?us-ascii?Q?FPlJb9smF36+POMESYvBqKEHFjnk/t94Xb6tDaF/Mj4uc/We4hnjBfRlcTaw?=
 =?us-ascii?Q?u7Vyfxif4ZtTu+b6YOmggYSXZLUdttPv0jYhfeZ0YnvcCrOLXYCiTN66v421?=
 =?us-ascii?Q?lqfo5Pf8nOtyhb/8QovPhYePrgmwVj18jAi8omR0M/j2C94kgs/deN2mfeoL?=
 =?us-ascii?Q?bCL89XiuoSeI0t5iKUI2fS/a/DYyQgZrosvmvuzHUO7AcwZphGsvCB2ATzXR?=
 =?us-ascii?Q?9CHT2QwnQTw58kVzzY/vc7GodFPOAvbrv3Z9Vz4F3yo59PzJaLe0JWl31svT?=
 =?us-ascii?Q?++z+2kdHDAuIuGhs2OaoK9cQF6hqhdlh8biz33jdyySro2etjdENZ/eMGHNM?=
 =?us-ascii?Q?3ztq/VvyW2Fmw34kjW95Xor0GSPYVBtMRSAiWUg+N+keKeIoa05gwVqiw1m4?=
 =?us-ascii?Q?pFYYmihV4dafCfVInepsf1XWEFnwn31ISbc3TSnrm0LEX6J436fESmCUnLUJ?=
 =?us-ascii?Q?iXwQAvdVUd7oR7qMXNV0nya1iI6DRxnIKweU7MedxH1QZnY9N0Dzo5qThRnO?=
 =?us-ascii?Q?ayFz4tc6gYglyGqFrEzBXOciuDXJL29LE5m3Gh2QesqYISCdx5onEqPtyH2u?=
 =?us-ascii?Q?wDALtAPMmTzVG2wE33FrM+8bWRLdnnIG1YEIRvoFcJJt188F/I1NzQH40XIy?=
 =?us-ascii?Q?e/S1nsG/2BdT4wu9lbV925U89JLudYKh8sYsstc+Dw/5cvLs/deIPdF5MoUL?=
 =?us-ascii?Q?MyxHwUjZAHQTgNtk29HMYfdaapQTC5l94rYPzki2AWCPP/nMv6D2XA9+/BIy?=
 =?us-ascii?Q?IyvMlH4Qj9OYZb1IAqoZXI19ZOfFEQ4/Cv7WmA2lcQ/Y8lhutulVDhIJy6Ez?=
 =?us-ascii?Q?tO4z0Q+p1MSxRGUDYlEUmNzAhiaZRMCJajGnY4WXQ7hzUqUWhf5tesLvrym6?=
 =?us-ascii?Q?iV3krsdcnaIHOYtcdAhq2VTwLzRbM0CZrZE194ZzK3+m2kANHFOeGcusHOuw?=
 =?us-ascii?Q?dtLsi6S6YHoFoKHVvEfpyUUK8idhhw8IrpEqM34SinIfT2F3SSHLGwzxP9Aw?=
 =?us-ascii?Q?aEnqYGOLFSMwsBmrqhNsROHPPB5TVOuoSSBuNTDThDNshPfDsB/cT5/BwvFV?=
 =?us-ascii?Q?PS4PS2fVWWb7pnf1dY6g8Ghc2bj3ZUDiOQ41mN2gioZnRm7Tz4oOcTVw5zCo?=
 =?us-ascii?Q?C0ZXBQbD2TCQOeoORTO2ERvxB+py1CQvjXh2Va0ZhtVF54qoJBzoMsWlEZFW?=
 =?us-ascii?Q?qEQJWD4MZZSAvGGUv719lj3tapawh5uj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oFXigvH+Urpo/qVpDIS33CUk1THleh0i5uc6Ij0PMXZ1yGOaGLudL6wMe+s0?=
 =?us-ascii?Q?y+gPnQGcWiVovlY+GNf+01mco0Cl7H4AhRMlJY+Vbk8+OP4tOhGtKMA6CNSi?=
 =?us-ascii?Q?nBjyE1xvRtf1jd1HOE0yC/DQDHVGipqCQoXemEAf7Lkw03vsNw0zMfmYvLyP?=
 =?us-ascii?Q?7o9Ru7xAzvuOC80siG9diUGfCssl6SC91EFWxUtReMY8L4YT+XWPU1da2Dxl?=
 =?us-ascii?Q?JVVDJincaLK59SnM+LfzZnXsNFzX5VEGy0rUlb59lxXJZ5B/iZZR6ja8gd5+?=
 =?us-ascii?Q?00OuSyNySo1T39N6toKzxHhkz+mstDlPA11W9SG/0itvG4Q1z4Q9mD2lqBL/?=
 =?us-ascii?Q?XKuwVMi2iPiq267bVchGLyKlnJC3kvenrGd87bI+G0P2dYnsCqu1T04iNnbl?=
 =?us-ascii?Q?FiDeA+GHJb5ajS4Mtj5OpXUbwQXIhRXqqbpWU41qsqYW6bwuL7Z32/xzZsbc?=
 =?us-ascii?Q?fDFsR3Vc1ozL/EGQgVM/f7grbrBXlTlt1NNRFFK8MoH3CXhwHG0K0kOPpDhw?=
 =?us-ascii?Q?gQ5NfnaBqlMe+Gfu9wu9cRC91GBsRUH+ZrxzdVlhZiys9BC6BbolG50yg7W9?=
 =?us-ascii?Q?HTOqRbuGI3ibRZB7c1rPqTavlhHVGRc/+4Yl1S8KVT4uZ55v6kvfQwzmLqe4?=
 =?us-ascii?Q?w/u+lgSxxwlQwBQhOKVjRq/txOAfZQlNXCwS/9TXHYL/gJ1OMNtRZTyopayq?=
 =?us-ascii?Q?yEvhC25SL4PJoifbWZmD78HltvlTMbVH12uB5pkxVhpJcFsXfeejcLpfP61U?=
 =?us-ascii?Q?QPCPdabxWEzO4NXoZyUGfB2SwnwK3Z6zKG1djdHExHjRl6WXcwXFk42Kch8n?=
 =?us-ascii?Q?OuY6IhOdct1eGKP28WAO2iMUafVrnEeJtFswgDgLIovWDA4rdJBJHq0ETNGc?=
 =?us-ascii?Q?y/RsBmwaY2mRndWt62zjPakAgoHmHIxnwD/+Mlj4TPL5d98AwXFNRbM70lsi?=
 =?us-ascii?Q?ca0n+Cz9n0+qb5fuvIu11RTkjEguMcFQKJUnB+iR8f0yl6o2/4uDOaw+pks5?=
 =?us-ascii?Q?dPeLeH8S4BoCwirrM1dQV8CcM9RW6RakFo57It9v9QcQvIBWty5W6p00Iqh1?=
 =?us-ascii?Q?cLdpAE+f2SdSaNOdvtkwZGNVyjxp/5jVNGapNkRib8gJFpRA5p+c91xvAUVM?=
 =?us-ascii?Q?9VtMD0ilSOUQmcTAFO/93n48z47i1ocBx+z85k+OlvTBpOLcHhYkWzhTX2p/?=
 =?us-ascii?Q?9JGZhUB7WI8nJevUOlSjA9WDlVuqwzQITJs19xm381vwA3vPSHoJJkkvnrgd?=
 =?us-ascii?Q?zExuvJ44BXY0YOIzek6jCW03jkfsNA2Jvds7gGcVMC+o9cVyit7OkNtAGQfR?=
 =?us-ascii?Q?3z/fuBYBvN2q5vFNRl5QF5J852Ijd4lZkTrjR0RLYppmqunjKzNJL88Q0zpe?=
 =?us-ascii?Q?jhapmjT0bDkpQyYDich7G5lKCY1l8xL39p+ojbvA+GyfHTPpmBV0BV/4EOyz?=
 =?us-ascii?Q?EKO5vmF2ljZPWRvXUIeeBKD8VPXpoafd11ZSExOVBwJuSLk8hO0+X3PPmVaV?=
 =?us-ascii?Q?Uj0lwuw6y108a9s9WSyVX0sZH0duWE1A7cwO8giclgx65CV3lZM/pxlAJt0p?=
 =?us-ascii?Q?aeD8eMAb54YB11hg8Rh8m+n2fM37IjZjS7tcSQha?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005291d9-9c67-4567-2fc4-08de0d40cd9e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:32.4287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfLTGFuypNhDjxwzMDBV7KIyTp3wNJJvYn64muvBmD7lunc10MzwYX2aLLb6GYmp942jM3aRYLPcRxUw+ypu9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v4:
 - Return bool instead of Result<bool> from is_riscv_active() as it
   can't fail (thanks Timur).
 - Update register definitions to correct Falcon
 - Switch register definition order
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 734ac0fbfb49..185ed6d1cfb8 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -506,4 +506,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0585699ae951..3bd1bddb16bb 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -324,7 +324,12 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
+    0:0     halted as bool;
+    7:7     active_stat as bool;
+});
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
-- 
2.50.1

