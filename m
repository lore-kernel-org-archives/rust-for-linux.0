Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFB2E5B32;
	Wed, 25 Mar 2026 03:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410788; cv=fail; b=N2XdQeSuz6FvCB6v6+G3syqZIkj+rdlDFN3t+Mz0yor+jAEasMp1JFEXJ7hhJxdYVqNHd+j3KznVRsW0kHMkMlqFrL9VgmnpPGFgHI2xHrlC7+x+XERcy80AFkjJjsCXC8+nznNr5d4kAPgEirJNkpxWiFafbK+JK/fnbf+IzWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410788; c=relaxed/simple;
	bh=TAJKGRXFKGRrb9Uxsn4wPwawQlU++wiPLveNOozUxyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nf8rmcMdC05ANLDdMcSbst3ConnbtBxbEjJipSoakfKBb3AiUSjWP347Loeg9kBSsrGxRdhaQ38JZqdBgbXX1JxixgPNoE4Pxoj+P+ipAD9hLrJxx+QfGllUC1/5rlfQ/IFCX8MxhaY47RhDhbyHmVFQEDgnVxJDmCKdvykIADU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c9AcQnrL; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c9AcQnrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k04gjZVq7SksMyVozIcvy1+xjejiVnylxAKtWMcvNr8glK4afEIg6zqOvVAPoCzANb5d3EENYsaWUO5bB6q6UUSPbWryEMjFJS+QkV0q1lZZBtbAd6HtmqRvOsbff37fFxcvG9cSEuFqJDubSfjzwZA/VY8dv7FhQeZApJtL4E/7cFt5EqfnPw+ryc8E/fBgebwfCqAvSaLJ1s0CZFVQY1SEqdkBKMkLZ9WYHiN/Dn0kpBJwmE7QS9WANdw9DGmcw5aQJciRITVby0lAFy5ve6zg0fNop9Vko+tFNqk7euSnJLsIrq9X8/MCQIY8qCXEqL4514IDBWzEDBf14s5ISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtXynqz+dK5MHq399KbbebQm50z6eyjYaBpIt0SwMtU=;
 b=L/CNv8b7LaywPp9lrJkKPpDElPvFnbCUbmbdyVex4JNIzAB8fN13YvXnx5kniPM4OG7tKznHigT7nCQZT7wLPV+PONJXoQk3unjapCduWJujXMTN5miCAeuj3R7IiHiRJyeWWEyuehK2E+F7WLyoe9AoqZCbe0rNCSRVaXU44/KSFkc1yWMmUeC+aXa4NHvRkpd5RUUIeOA4Duuyu2FDN6+TuN+xFp2DOLmpZjR19LK/ZvCBi1Tnwy19qhAKNkMv3lLKM+M0+pK8M2VI0c5fYEFkJFYwFHlsPFsHQFahIYBW7nwIHWojDONF7du4tyeVf3QjuVgn17buoQ9VrdFvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtXynqz+dK5MHq399KbbebQm50z6eyjYaBpIt0SwMtU=;
 b=c9AcQnrLpONB/Ggs+kiRoTlZaMf7j0svBd5hUl/hjiP/YsX8X4uslopwozSAnIzFAjD2SAmqM/3fFVn6T+GerEWgj6HNjWR76UXWLWXxhxABTF/zdmoFczKPR9VEEeVIaH9tVGRhYCdgIDYWBdL2+NgbcokEanT4q/Iw4JD1EtRqz8yZa3u1UYdqqf/Q48kbIS4mAhW3dJqj+z/xdyOZoW5x5KA+T5aL2jc+CBg8h3H+B5mukKa9M4ly3zt5F1bIH6HHzUrPOm97U2ZraACtD7RfLdzdIxeTUeDzdg0uyCcSl/6J8rCIyuKGX9Kkb/uOMfmlzAxdiauGzyuJeWdFCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:48 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v8 03/31] gpu: nova-core: use GPU Architecture to simplify HAL selections
Date: Tue, 24 Mar 2026 20:52:14 -0700
Message-ID: <20260325035242.368661-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe920b8-cb21-4ebf-ce60-08de8a21fb2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uRbD9LDTrZcgn63Xiwdkxk189w9q1Ea5USIeWgYLsxcwKsq5QM/SD8IxHx4oZ3rEn9vbCsIQc80xS1gBEdkfzmabmlNHOGwumMhMs2MaDYBM+Hod+7lgDPbbceeUdoPN1feCblLxWBODEw9anbkNmD/rzKmuk5i8T2bDiNkZJx/DinmJRug82m3CA8tAa9qtmHDYcpgDJSi1XB9i8QA+S7gGOsm8ZvTv+3MxrW+9UwUP2tTsaE9aM1sbueB30ssd9M6h6zhplLelTtQM4Y/fCTB+scR0r3fDW8CHqsJDA4hy+d6OdAVQhHHxHA/WpQKfpNb4Kss7MA6UjGuIw1inNoJc1F3d8hN62v8JP6ZeEgQH3zjfesv73HvT3rIIBRw35kHecwc/tzuPKnNNGRGxWMbJmA7stt35caYhqGs5K26vvWIdggcQdbzkCAQpWB3Hy2xATPdqHLtt4T+q8ZH+HtTvVYy6viBPXd1fnFdzGg1iZpp4cD6quXwYrvjaClJB/aCshhAflfMmUY5mHwxQTes4M2gate94Y92PbzfuzvubF1sAycbsiTW4jvrc76blXDm2xmTJHi3TdsPuwHrRSXTcq5b/HcFqUU/t/MCWUUU5FuSiFNmfdLAj67OxIzVAxhLPHeW41sKBZZ5XCF9AWCYpCLQ7RqEAn1/wSZcrX//bXk0nk9NPrHUK4w2cK0ch+bLelkl3ol/9hpG93znV8p/d6+T4rs6q3jLaT6EvKfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KOTnvltZWmw2Tx4OIOx0hfjcNZO4WcFl0fmQFlaCs3YvjkLj0sbiQ2paMrCH?=
 =?us-ascii?Q?xMRseX+Qvf2oq6tDiNL7L7SrkjxAPOGygic9dmCZ/BSdH2pdvAM3AO5orZUd?=
 =?us-ascii?Q?8pPpJFP5mfKCi2zQPWTKSdfwV1N5d1839j1eH2DO+Csawvm8jK02I7SdZzWy?=
 =?us-ascii?Q?3H1QsSBOtO/1mf7vccDlpE0WxRUbHKKNRGvllwz/MPwqxKQ4K+GOY/45Ui/s?=
 =?us-ascii?Q?4wIAgQP6jyLrsVsSVzGIiHb5DlMqKCKW1kXDRvskwzZaH00xNw0NDsya0Qva?=
 =?us-ascii?Q?tFniqa9a5WlA0gSk82XGbmduwvkA+h4Q4BFu2tOr7W5M+j36s/9X7Gz3DkIh?=
 =?us-ascii?Q?ARcaLdf+9tYGjusPSB1TAdRsre3QbHg+J5p5/GztqiXIr5xKLSbIhKlTi4Th?=
 =?us-ascii?Q?8cWTLSxMncNwSJxoFGhlXIO4b+CzTP8naFQlJCKaP2qkbZI3zL6tKX427BXV?=
 =?us-ascii?Q?P5ByafEzp9JGl+2JthJWRXgKeONNLMlaLb2MHZMxs/VvrCDv/JmBcwbkm3g6?=
 =?us-ascii?Q?xNFuwqs3yOReciQJsW1cBhla0M2p3Ysd3wOBk8leq0CSHwWm66YDtIQmpk50?=
 =?us-ascii?Q?Ixg0fspNnYR+ENDbmQObV7cN+OIclt/XwFhcjFLxOhPZ+hYaf/uD1dEn2LjA?=
 =?us-ascii?Q?WgKbhXuBVcMCOkWfzpGeJW20oY/8+K0b3urQceOxlP2AyrFVeRT9phRQdIUK?=
 =?us-ascii?Q?MfZ3p5YN+hGsK8M/UktvWmCRm+J22rPRiTrFkFQn14p/Q7eNuhHVq3995uAU?=
 =?us-ascii?Q?wzu5cV9uZ7qdJKYjF6vztmC/NNpn0kO+4xmEXygkZkwQZXuGJFRs5ouOZovi?=
 =?us-ascii?Q?3v8PvvpFN0+c35Vxblk92I4+q0jKf7NrOL68+zI2COuj9NDhKSGyIkSFRHJL?=
 =?us-ascii?Q?gExfXLTZkeQDIBXZBAKkJiZqr86on7HQiQQj/fHvaBl3AVNMJ43r+TUhSik2?=
 =?us-ascii?Q?1zALMg1XVFit67RwrzdVUZdt66K07fSMHuVculsQ+F1XxC/oF+XPhfAq0w2W?=
 =?us-ascii?Q?4lUUVYgDgUgjKJ92shVn6NSWZByOt93jyJn9mF7Rv39wpqL7A0ziBvfxI3Bo?=
 =?us-ascii?Q?gM3kmXbccq5yD2Tu7wfBcfhpo6J5sAJdss7UKW2J4L/b+2fRqgBEfXj5o3zo?=
 =?us-ascii?Q?wAC2Ot+ewkvlV/lTc4rTXSjAVJ0micqW8ChamTyO3mhXzlp/PcIRIR8Jz3PD?=
 =?us-ascii?Q?520f0ELXKayvkWTwhE8QC+s/JiZgnzG2h8qJQv5Mbqvw3mIggOc3BiW/9SYg?=
 =?us-ascii?Q?42cDd5MMCmZ3XjwLVGqrLeYG5ZEMw357f0O3bbmXoY7Pb4SS6x2Z8cWYdq1/?=
 =?us-ascii?Q?KbxV76C/wr1T8E2qAWARZAooDhMZNDhBFOOEgAoORxNK7vvEeYfDvN+uX59G?=
 =?us-ascii?Q?bE/jDnRqK+UDZpep2c9pF8TltcDiHTD6CCtVnS7JeepqHBZ6F3R29moQYiRZ?=
 =?us-ascii?Q?IFQk+pzGz083Y0gsSEk30P9RUybN1furIIgRBYe2kr10Q/aVsmp4lkeZPrmX?=
 =?us-ascii?Q?DAB2+D5w9VIyqflPmwx2bUT47CSc5xy74b0rMi0h1hhxujSTN48gkArR6SuC?=
 =?us-ascii?Q?gs0EMPO+d1IFhGMXoDvsbVmX3jZ+7LWz0rKs2XRbCzm80PnZCNKJtJZYKcS7?=
 =?us-ascii?Q?uJ7hAx7WUtAy8C16YhMzfOKGg9nxVkwV1A91N44cKdo/6pdkSSpTTLFWW7Fl?=
 =?us-ascii?Q?fS4Tv/gqLWWozam97JF4eLBWc3w1uAjqDKP9nuyQjSio84GrkbHmzBFzpEs8?=
 =?us-ascii?Q?7rz55EwDbQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe920b8-cb21-4ebf-ce60-08de8a21fb2b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:48.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t//1pnHxm82UZQsmKgVz2FGTvshQp35mKDslq433/+gjyoY0rPLuhtxBO2JOzk15nd+yxqkZJI2W+I1BuEiZIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

Replace per-chipset match arms with Architecture-based matching in the
falcon and FB HAL selection functions. This reduces the number of match
arms that need updating when new chipsets are added within an existing
architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 21 +++++++++++++--------
 drivers/gpu/nova-core/fb/hal.rs     | 17 +++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c7f12f2a7a35..721c82f6a831 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -74,17 +77,19 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index e709affaa7e8..d33ca0f96417 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Ada | Architecture::Hopper | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
-- 
2.53.0

