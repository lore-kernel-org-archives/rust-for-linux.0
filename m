Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012012.outbound.protection.outlook.com [40.93.195.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7C31B80E;
	Sun,  1 Mar 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772373881; cv=fail; b=uQzs3rpX7yEaTHQs9tiVT0IQcljgdevSgU0DkxAD7WbKjmduKm7oDochXZRpbWAApL4cpk8vXiJpbyONschVUp/Su55S4InqXPkVNWUyJzlFAE2aDo8Fu18OukOmBpEKZwE1LbseFRNA07qR9AgTEt7tR8hkOs04CygAHD1u054=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772373881; c=relaxed/simple;
	bh=Q4qBBrva5+Z8fPoEDTI4B8a/nGVNLhKu4nMOCM7bTyA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jQB715fekcMAnSSv+2Bpu4nI4qqpZ0E7aTq+PPfleh49IaPcINEI6f9p+Xe7vFjAmX8SUI8mmu/K3MaIOHbEzcheIfVyBGX+TlGZSOkR8CMQTKN0nU7oqBi2TE0qq65wPcxgqVge5xSpmw/hC6tfCQ5SHtzflKEjd+84zTjAWSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DYHGDwMs; arc=fail smtp.client-ip=40.93.195.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DYHGDwMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHfe/PUNebyx+ZeCSG7sx47i0g+AguXQ8tnSPS5fLcURpDvXp85jWiZ739uFyr9MUqaALgTsHz72bN5ah9IO3VOnnkO+mq972C0brhkEcSvWgznPPNSTItlGq3ur1Tfn9f+KNypcgijpAi0+nY4IlTFA+NJ1CJAGAxV3XCPDsy4Ij6OBYTErnYF+kDmfS59dedcoBvavlNGPkFORhOoEs296LGcVPofLJvEuqmIqq6VI8+kbnGeCeABFXn0j8yBfX3msUnih+pnoyTCL9TsFQan7P7nvqYhIFZwQOA4uKqQsX8HtAQya7eOD6R8ltcJUQe6405Nr3K7DSIIIe7Hwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6qRJevJnyZ0nVdHsqUErwx2Tah8MwUipzOcOQHQFmY=;
 b=i3VOvXDSqD99rKPYJtCg/YhJVu0QZnxosBF+5usFT0xonAKzR4xlcVam5u/EWVpaBMjxU4VQqNaaRszsxLVYG7bQzIm1AQr/M/F0uK5fV43a6s84OU0YoPSS+OaWbX47dZVRRWvkMuCf0sz8dF3MWZCkWGduvIa5T9GrpYudFvuF6JHlkkS8Yn01L0xZBISILTBImQiK3Sw/ndBnrAGnlAK/tJS4QlzTNawwAOrlQQmxRhQGKaUtuMetgSRtGGuZZzT13bWP1UGpYs8K2WaKZ0a5VNOFGkSjgGgR0ipIXxx1a1l1VQ2MBB9qA4VWDVYaFQR4VNa9iDUmu4BQ631btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6qRJevJnyZ0nVdHsqUErwx2Tah8MwUipzOcOQHQFmY=;
 b=DYHGDwMsWxhMLNdJKJAQ+zZ0/5T0+z9HTzLwpo4l4xxScDf5MeK7FsFp+ulpwZZ4kA+8umfjYZTQa6V/b9KP40XJ1qF3TaqLFDW0iCz/opbIURsTFxzv7FI1YUVlVSHQSBT+CSsaSzRpCiYBeX9JetjTQ+mpMjxigSJonGA+ZaXo4+nZfTL66gj4VFEPozwHX70ibcChSY5Ds/ZhHdbrIF6ztxIgeoZ4A3aAeNe1CEif2Ew/iez5M+cBspQDygXchlkB2iOtzIzdVVgYwTn/m75JC2sBMG6bnx+IKY5CygZqBmr+mxskSTpOK9qnD/mO3fwvuxnQOxQWMVrbNS66AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:53 +0900
Subject: [PATCH v10 10/10] gpu: nova-core: add gen_bootloader firmware to
 ModInfoBuilder
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-10-dde5ee437c60@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:379::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: f06ccc66-3bca-4402-063c-08de779b791b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	UuEX8btFhJovvc2ZEJWjGlxXNFGTG5K/SUkLUEcuMyfRx2BBHl8Hi66V6A1Mrsog8j0lq0TmUhrCs1DqlLAIbrL69MnKRh9o+qlHRQ3ZBREglAdApVA0kWQsh6Gm9y6BhMXtO61V0t7jAICAlK/Q5xFj6h/zL2cDs5PIfHnGWJ5wvmrs9vTXWXtn+lOmB+nlKwx0hFYZyDueuGEXLzQHAnqXC40jnc8oa0mOyB5+e8huDdqfvSxzL5Nn+Hj7fG2pKL3UqOd4cxv1g84E8VqHYwQ5cEm6mifPapyXxSD1AGqW76DIkjAXIuwjPa+6ToJdq2o9Fo1KW5YCB9Bb+CTgOeu0V3Eq2iZO3jxGQlDgOpFx+PHjGOVRrUAYKI4srFnT7vGbi/pntOk14EbRm2G1V7jWaxxJfLy79occIpYTVf3I3VS6S/N0kR0Ngvkcm6ayKl4ZwgPkduEVMU7WHeSpDZjFq4sUmTRFCcaid/0nrn3M2a5d5aZzAg6yAlRGGeDoQ3p25x4eoQ+QePL0AHbW6OnjYHBCKqPb8YGOGwl6KTMzfu+xcS6OS6Ui0N78MkX+9cZCDeWPvc2/Ze0v4kfYUNpgy6TTIgBeajUC4+y/iAhucdYBY+relC4JRKiyiH3PYA13+fxWrQgl89FzQn8+5NEwcDO921+dedoMfRjVUdNxZKQuy5jL0uSOLCgNOPgSFnZp1+wgpHaGjuPbeY+RhV4fJ7+HpErFqg2iDDGYEr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlIwbUM3R2JqTnZEOTZwNmZWNzlSLzI0TEhLSjQ1WnMrQm41bmZMNjIzNzFW?=
 =?utf-8?B?U08yeWM2ZEx5NmdtODRLZzE4dElrVUhOeDFYMk1oWFBSNDg0MDFzQ0xVS3VQ?=
 =?utf-8?B?THMxcGlacDVHTW5DdGR4djRxWDl6NEJna1BQLzZuZURLZ0UwZStEVGR3WXVw?=
 =?utf-8?B?eC83TFpDelZod2FLSUtEb21Mc3BJNWlVaUtmbFdWUUNwSHgvcUsrNXF5NlJq?=
 =?utf-8?B?bVRwbjh2djQvSjlsNCszZWJRV1BQemROTEtHZ0szMzlMMEI2UXhickpqYnNk?=
 =?utf-8?B?YjBBbUtXbGFSU2lqVXdJSWIzb255TE93YmJRQnIzRHdGeXRZRCtCdlRjbFFV?=
 =?utf-8?B?dFlOM09hbTF5U1VQOEx0UUhjQnF4L21wZnRSRFNDT3NmT2JmSWJ5aWQxN1h5?=
 =?utf-8?B?QmJZSUowNTM0blVXam9BQWR3UlduTFFsaUFQbkgvUkMrdW81dkZkZWFnZ2Jp?=
 =?utf-8?B?WWJDUjEyVnBteGI5OGF5K2gvNHBsRFRoeEpXTlI0ZG5XRGxiUkhtUWZmQjhY?=
 =?utf-8?B?Y2lOV01wSzlYNmhaM1lJanBTdTQ3cSs1S0t1NXZVZE1ya21KMnJvMFUyUk9K?=
 =?utf-8?B?b1B2UGJhbUxNbUg4V2FucXRnQUxtdHRnSEUrY09vdGdYSkhDVlNxVHRDZzJT?=
 =?utf-8?B?WmM3N3EzWDJIY1JsUyszWU1PTThvcEdOUkVpeFhlQWZTWTUzOHlIM2Zhd09q?=
 =?utf-8?B?a2E0blhYTWhyY1haWko1NFdFdjljR3NVSHR1N1pDSVE5NC9FaXpIdDdLRHRx?=
 =?utf-8?B?blBqUjFoZExSZmdoUThsT2MyTzZqL3hzMSthUGs5VjdTQ3JvTFJkNEtoTkV4?=
 =?utf-8?B?NEFLS0NHQ3JaNWUwMk5RTXBXM0FMMVNFc3FRR0tJbHJ5dGRscWtDRmpwaVNM?=
 =?utf-8?B?alpGMjFlbVBBeHZ5ZkZOL1JkUHJmeGhDZ0RyWWxTSGx5Wmk1T00rSy9vUXhM?=
 =?utf-8?B?N2tsVGR0aFI4czBLQnZBOERQMkxjb2Z2bjhPdDFQaGFuTTBrOEhsQ2J2Smk4?=
 =?utf-8?B?QXVXczQ3UG5rSlZFSVpNNEdMUTFCa3cxd1h3QS9yN0svQ0RCNFFVUHlTWTFY?=
 =?utf-8?B?d0RON3lxTmFyYkZmMkQ3eE9uWFNzM1QzaUdaMnBQU2RwRkR2K2dORGo4WFZQ?=
 =?utf-8?B?VkQ5WW56Q3dvL3lKSjd6dUhQalRzRCtzOFh0ZnprZElsWFNyYXpwSE5yT2pQ?=
 =?utf-8?B?NFlpRzRXTmdNaFc5VzFMMUdiWUZrbW1SNHBlVUtjWVk3cUMyOUIwTFp0TUlC?=
 =?utf-8?B?aytsclFLVy83VzdSVE5oUzVXZGFBai9HWTV1dDNwazM3THV6OUNZYjR5dU5U?=
 =?utf-8?B?Mm1YSzFzZ0tzY3RDQWlmc2F0WE1PYlltRmRNaVZUM1lxTXVZbU02YjVrQnVj?=
 =?utf-8?B?anBmK1BZbUhlMjJUenNpVmpsTGp6ZHhhZjRLeUxOcDJXcGM0cVphSW1mYkdS?=
 =?utf-8?B?eURoTzFybkcyc2RLaEg4a0E2c1FOWWxNVEp5UHIyOEN6cGtxa0hOQzFhY1RK?=
 =?utf-8?B?cEdqa2RwM0RlZ3JSRXViUXJidVpEQWxIbHROZGNWRjlkWVA5OHk5MGJUdk5i?=
 =?utf-8?B?bllqUW96aFJRN3FVZnFZdUN6NDRITzMxL2Q2QVR5OEYvd3pVUk5ldXJobjR2?=
 =?utf-8?B?Rkh6V0pkS2FzZUNrNHRMN1Q3MFpsb1NQRTBydmYvNjNTL3IzZFM3WHlUQmwv?=
 =?utf-8?B?dlZGTzhGK3UwRDdyUFZwVkxBYi9yQ3c4citFTUpCN2padlBOZEpxT0lwMDUw?=
 =?utf-8?B?czRVYjFWWG5XbjZYVzBadzZYek1ndW1mMmVkWC9jR3k1L1JPblhCS0VHeFVU?=
 =?utf-8?B?amhBV25NWU11S3hUc3MxaC85cVBEYkt0MEVreW5yRE9lZTJ2SWcyOVAraEIw?=
 =?utf-8?B?MVRyR2NKUDdka0xLSFRIMDNyS1crUnRSWHRZTUJySTBPZlJ4RllyanYweFo2?=
 =?utf-8?B?ekVQMDdKTHpkVDd4ajRoYWptdG42RVV1dm1NQXhjeVlxNXBoYXlKZHdCWUNE?=
 =?utf-8?B?UXNRd1ZoV0ZxcXo3ZWQ5ZkJ6dWwvWnFEbVFTUUJIU0pHVWZCMy81czhVWjZh?=
 =?utf-8?B?WDVGKzBITlNHY210ckVkcVY1dGYrck5TMzhMdUdKZDNZOGx3N0N6bUpOTG1o?=
 =?utf-8?B?YmdWQzBOT3hqRUtRc1FwQUtxRUNaYXVicUJxYXUzS0dydWpyMjJwdEI0Qi9K?=
 =?utf-8?B?akc0ZGNBRWovd2lic1NiRXhJVVptaU9XMkhYLzFWRG5EOWZMcS9CUUNLbXpT?=
 =?utf-8?B?bmtWRjdXUUYyR0x4TC9nc1BXK1hSZzNFSFRNeEpXUEJTaW9hdnlyWWFKRTN6?=
 =?utf-8?B?Zkw4VUZrUE94RXc5aWJDbmJsd3k4aWdIZkVLYklVVkFROWtvVzBKaDk3MjZi?=
 =?utf-8?Q?IimBwLo4v75S3A6zn7Qqh5GPAbTkHIzxmuEUHLZr9Q3ZF?=
X-MS-Exchange-AntiSpam-MessageData-1: y9g2xlPO2nMqXg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06ccc66-3bca-4402-063c-08de779b791b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:37.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGOoe68OhlnfOG4iSIbSqSbEegnFsB9bpE5NtsUkFJvXK/tzd/Tzo/tXGmf02s97Fuwz8uQBGPpg8kWrvC7ZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632

Turing GPUs need an additional firmware file (the FWSEC generic
bootloader) in order to initialize. Add it to `ModInfoBuilder`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 21 +++++++++++++++------
 drivers/gpu/nova-core/gpu.rs      |  7 +++++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6d47a6364c79..6d97fecefa74 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -415,11 +415,20 @@ const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
         )
     }
 
-    const fn make_entry_chipset(self, chipset: &str) -> Self {
-        self.make_entry_file(chipset, "booter_load")
-            .make_entry_file(chipset, "booter_unload")
-            .make_entry_file(chipset, "bootloader")
-            .make_entry_file(chipset, "gsp")
+    const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
+        let name = chipset.name();
+
+        let this = self
+            .make_entry_file(name, "booter_load")
+            .make_entry_file(name, "booter_unload")
+            .make_entry_file(name, "bootloader")
+            .make_entry_file(name, "gsp");
+
+        if chipset.needs_fwsec_bootloader() {
+            this.make_entry_file(name, "gen_bootloader")
+        } else {
+            this
+        }
     }
 
     pub(crate) const fn create(
@@ -429,7 +438,7 @@ pub(crate) const fn create(
         let mut i = 0;
 
         while i < gpu::Chipset::ALL.len() {
-            this = this.make_entry_chipset(gpu::Chipset::ALL[i].name());
+            this = this.make_entry_chipset(gpu::Chipset::ALL[i]);
             i += 1;
         }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c14d411c6759..8579d632e717 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -105,6 +105,13 @@ pub(crate) const fn arch(self) -> Architecture {
             }
         }
     }
+
+    /// Returns `true` if this chipset requires the PIO-loaded bootloader in order to boot FWSEC.
+    ///
+    /// This includes all chipsets < GA102.
+    pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
+        matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
+    }
 }
 
 // TODO

-- 
2.53.0

