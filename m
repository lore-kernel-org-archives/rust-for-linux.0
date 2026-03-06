Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287C7E0E4;
	Fri,  6 Mar 2026 01:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761775; cv=fail; b=BAW2kfV2L7sxcJqnQRphDW4Qo5R7CUZE1gWJo5VSP3roHkMOyScE4NmvZ1VoGObLw5poLvHE5gpwbNbIdjHJj3694PfHE2mT7C/2nu9SU8UkesrfuZT96bnawToEcAHZQLdN4YYYY9FaiOHdQbPQMKee3pxW43wSmoY//sJYYro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761775; c=relaxed/simple;
	bh=ABnU4ZcOO8swzfzJBO2VYqUHzqkMuIczUNgiPGT0v78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fatoa6pePzqJsGqyM2qpcFZVu8/kn/PIREKy2+QIfEPqvpJ8AfRywHA05XrQXeEnHr44Y4NNTtbpKyrGPCz9V7Sl/24DQpg9Ggbw7okE9L626lz7g29EtpVIQ3DtLHlOVjbvBzSai4wQfDG42XH3V6h6SH0A15hkjAM91hrLMoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qxjrnaEu; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qxjrnaEu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGGLMBaVYyzZ/Em2P2EboanWM+gZx2BKksVkuhIGDRV4Pk7pVr+z3J5GBDeobzaizizBH5YyxHlIq6MXSD1KbDRBP2p2Mxxj50SNAFzbsrNoOVsGTyJc01Q4lUsOi8tVenoPCuCTaLki8EkgibMSt1hDL0JyebiZLayhXyhhoL22jWJOApR+fcRP/4hlloQPwcOTJ4Ib1LrQzahn+XSM93NAbOQX2NUv1Iet+TsPwBTQmihbtz+EmjAdZzohroE9rC7nuHiaE1zLf7FWkWWukLqc5cxRdEBZ6BK1496WFX/NLZ4WK9kmEfLrlk2Qb76ojyQaN7VueKJQSJeib2wJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGIqKPzyKJmg0oCMfw4UrPK3mfdK3Qzjmvtu0gvJrAE=;
 b=HKD2LZipJxNTnm0zaKdJATw3deXOGvKdMb0kAgXG4YtvavSVL23uvMDQaUvEq51uNr5mcgLeg45bnsBcj2lgdlK/8vnGyDvLL+9l1oPa0i5Olxu0BtFIcR1NU3qzFKdmcLWfVqTExKwByQmPw/3Q5QU3+DXqm56cAjy57MLzmW1bzMEvUnpCQ/S6GLGw04AydMQh2vwhw/MIO8FjPDAMfZ0S8bOmp4xIhem+WEwOsc16TPANRUqxGHiX50EBwlNYpNOamA4h1aYynHj2UU5X+Tyeugwmp7h+gUWMMNLqGLLfRLDAXuX9lhHJ1LprxyEGHEGfDUpP9dCaAOm8Ws4bQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGIqKPzyKJmg0oCMfw4UrPK3mfdK3Qzjmvtu0gvJrAE=;
 b=qxjrnaEuE1uBZpYWRGw3E7szLjZsV+CFVBpx6pF2ubWAhm57tmePj0oKmTWLRMc6/ueLwX5JlRnYJGRIsYK0Weu7LWmaPDIvOlFrKovCdnGJhhu+cVrTYlyHxRXSULs15berwfBcNLGSSxguIZ1wsXZ+TnjAov82fh2XhFLQ+bFHv1AFnf5DOx2ITSb59o4R9RnZFb8NQ/GpItDKTYDxQ5izTw6pPXkzCxpmgGPZK3mfP++fng5ATbEbvAz0o/oWJNInBykSWS6+1d2P/QSgCcVzwPG9H6TI4w5Bu5bDPUTSz5iR0nnQwyO7gIlGbR3YopcPO4tSit8l3A7M/8+36w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.5; Fri, 6 Mar 2026 01:49:26 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 01:49:26 +0000
Date: Thu, 5 Mar 2026 20:49:25 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v8 25/25] gpu: nova-core: mm: Add PRAMIN aperture
 self-tests
Message-ID: <1772761582.8d97384b01bc8564@nvidia.com>
References: <DGSA61C5BMSB.1RFPQAR3NFHKB@nvidia.com>
 <855853e7-f9cc-4661-bb62-c8d4fff86a76@nvidia.com>
 <DGUO5DR4WL2W.21OSXWPYKC239@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGUO5DR4WL2W.21OSXWPYKC239@nvidia.com>
X-ClientProxiedBy: BL0PR1501CA0016.namprd15.prod.outlook.com
 (2603:10b6:207:17::29) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a993b5-8d3c-4e1f-97ba-08de7b22995f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	bMhFWtiGP5F7mi072cazVyacraruFKM2vtYudvleuOkwHih00oTcsfyorSAV7rcfnqeP2Hu5jycEhqcb5TGLIeDfemWKkbiWtTkHEv9XkgKS607Yzg/HDX17juBQZVjDm25Fcs2sLhcjOMbFFo0R3MH6HXPVgOF9Npk5tQ9OGMkkiu4CWxz0qnr93yAPMAti9Z/QjysknJJ9lAdUOa9gYpZq5HfmJf/MFagBSNanM7SDbqJQatZZT1XUeCoAk1Ufq4Zqrx/CMgmtcIW++VHbKEVoMY3fRQfWu2+jQj1J9fdrxGPP3pwujYiUWikxWIRHBO9gYOUERoyTgqEQ1UE+UiIEvTwtbPpWKusqqPjh/SPSpTjzXineOhytcQe3eBgJU/u2havCTjRtoRgwflEr2OHeLVQrcUzcAWMO7SHSkH5/ECkDSijx083B5GQiwA90JhexrlkiI7eTjFXbYc8fzSh7Vaq2IFd0J2k2Wy1o8wFq0jksfWUHcuj5vpWqDlhA18Vq/4u8cuGytfDgIOii0edr9EF5V1JtHpvQeTtLbbelKFkaG9bN5bINqHwAcrdY2fKgpJCbmWzqXId9ch1htb3gMIKAk0bVcChFyyHbPJ7agKXix4Va5xgOD1gwj3/66mWQBPrzurX0YmvbYfUrDQgA7GEH0ah4/oZzuTgJkdboNuD5zaJIlJB5aFIHMetV4rYy7pNjjxT/ubcwiLNh+E3NTp35agHe20Oo5YngGdE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HGd4wvijLtkq+lz+yk2i/GDik04oETNjWlOHYi9ZPrODJtZeCklQPZbAHvz7?=
 =?us-ascii?Q?DGv4Un8dimLAxiC0fT+OlkjG7jIdaWt81+Ni7NAdiVMeBU9/tTG383SgTA9j?=
 =?us-ascii?Q?cOkvSmuo98VdXWi4viUh+ZUZxdl/g52hOYnvdkMJdklabH1/+7gU+4MinWOI?=
 =?us-ascii?Q?5SPE0IrRHOfQdpPCZaRGLP+LTGzZs25kULgAi2eJJtlWGQDItnG2cYzhgr1/?=
 =?us-ascii?Q?9Rt+/qrw1xDVDMQ5WWeC5cgzRV9Mr9Sqytx2puh2ha+wUTeCC8Z6vTLPiZKT?=
 =?us-ascii?Q?DsWQY+1oZ65xjpz8g/sffsezemB/eIUcK3ObBBRIGMWlSU33kXanociQpgfU?=
 =?us-ascii?Q?sH28lJlxJLRt+PU2cUy4T65L7UkX7UFaFgrPUnUKWRaV35o9MHiOKoQhzq+d?=
 =?us-ascii?Q?f7scu2wOskHdTodi2HZLvyp+E3EZfCAdH+zH3IhFlBMZEOTTMt5B7e13LzXe?=
 =?us-ascii?Q?+enCbPxyu8tgnuQFWM5Tvz0Ah2qmIo/MFBnxImzf+K7JY9vDqcGjt0uaYJxl?=
 =?us-ascii?Q?5xvJmNDi6Xd+3PHJUqH68T6FNYOh+QsED6rGDji3cieCL+PxQfvrAI6YzrLY?=
 =?us-ascii?Q?aF3lm1zkXYi1+jXl5RpC/whFrBEXEmT5uH+TaErQOhzSe2IlUeel7ePlISzs?=
 =?us-ascii?Q?E+QfmkohD8mvgHd2RkEurcv7J1jlN2Zzgen4IQKBcxJJf3uelpguyHGMP6fG?=
 =?us-ascii?Q?Em5/+S5PHX5LfCeCvVfshLiowkmVvDabmX318J08/H7Mj2R5BhpnyXveL/89?=
 =?us-ascii?Q?5++AjFSjkK1t0LPqY4qio59Xa0FweyR8RHPfzRo6b8KY+GfVUQ117eskyLT/?=
 =?us-ascii?Q?Ziv4ZsRGUC6L78Z66UJAVaCCnuYzKzIG0AlbxrH59jMCMTDXHV1k8D4SY3It?=
 =?us-ascii?Q?KSP+ZiFzNH/TdnAVUqwaF9OZcescMjDxVzD3rs0QIMKdccwyj1Bph2G2kvnA?=
 =?us-ascii?Q?nfO8MIsozLc0t8L9lBDuad+W9afhnNdUN70uHUsD4EHEKSOrQQ3p7gbXCs5C?=
 =?us-ascii?Q?MSsms6AwB6btrCwDCHoMwImtCStDpl9sh/z+NOzMnNOTpuluWIthzlGwvEZ3?=
 =?us-ascii?Q?0Alubz8L5oymSCYJptKAAI/Ita7QZafVSAWP7nE4fC4lxF+YmRGLGvrwOII/?=
 =?us-ascii?Q?aucT6v2PhIWYMWBvu9oLaoLc3AjSZadyxkWvQwMk2YatqttiY4AVBOjlbgft?=
 =?us-ascii?Q?zjCsQu4zMK86bvTKJ/Kdu1CvHrH+t5HKu3aODDFxJCFJClngOBx4SZFH+UOe?=
 =?us-ascii?Q?Upmcr9uuICm9h0YnuPtzNB5k5D9UIT2gVo0QJtYXiqMB9lvcBpjr2Cca6on2?=
 =?us-ascii?Q?FCSDtH+uQn3MgZlNkwChpaSyIrlu7cNdDK4u84pDfvlxt3LyxG3pepaMY1Vh?=
 =?us-ascii?Q?Dm5B89wLiOTibtICIk3Xe8pkNQcPui/MikC9GKhnMaeiqye2KmM6axgcCHdM?=
 =?us-ascii?Q?kWKisWC1WtxsgZzpT8aozD8Vs9+7Er8AHeXvXgcv80m8oMbtxY8Mr2PwbUoa?=
 =?us-ascii?Q?+gY7aMDDcXaxMF8lXfq3CWl/JPgUC+lpZ12eLiyO/aukshdZAMhX9n6/qAwJ?=
 =?us-ascii?Q?13FaKzaTZXp/ROdAf1EikXS8Guai8QfI9BEckujzsUBNUmgHPnqbchbsJGHm?=
 =?us-ascii?Q?PDjYTcV9YJS3j4Qivsh5b1SJiM+4XmwwiHqv8QB4QTvorRwW10ZoowTCpf6t?=
 =?us-ascii?Q?Ecdnxx7ppExpGBO4YwrlAa7Jp5xJ0W3F4oMlollxwfisuVZcuDOmL9XfzRes?=
 =?us-ascii?Q?0lC0BGhQrg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a993b5-8d3c-4e1f-97ba-08de7b22995f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:49:26.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlT8gwt7wmYW/m6djR+CwoYYGEMvxDnayNPwzPs2yhZJ2dTqQtaJo1pBy03Hu3ppFXa2Lba9B2HlbKAH9PXXGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

On Thu, Mar 05, 2026 at 04:26:52PM +0900, Alexandre Courbot wrote:
> On Tue Mar 3, 2026 at 5:11 AM JST, Joel Fernandes wrote:
>> The PRAMIN aperture window register changed on Hopper+: pre-Hopper uses
>> NV_PBUS_BAR0_WINDOW while Hopper+ uses NV_XAL_EP_BAR0_WINDOW. Our
>> current code only programs the former, so we'd need a HAL to support
>> both. For now, V2-only is the safe choice. I've updated the comment to
>> explain this.
>
> I see, but then it seems that the correct check would be against the
> `Chipset`, not the version of the page table format? I understand the
> two are linked transitively, but they are in practice different engines.

Alex, makes sense, so I'll change it to the following then (still testing
but here is a preview):

@@ -439,17 +458,21 @@ pub(crate) fn run_self_test(
     dev: &kernel::device::Device,
     bar: Arc<Devres<Bar0>>,
     vram_region: Range<u64>,
-    mmu_version: super::pagetable::MmuVersion,
+    chipset: crate::gpu::Chipset,
 ) -> Result {
-    use super::pagetable::MmuVersion;
+    use crate::gpu::Architecture;
 
     // PRAMIN uses NV_PBUS_BAR0_WINDOW which is only available on pre-Hopper GPUs.
-    // Hopper+ uses a different register (NV_XAL_EP_BAR0_WINDOW), requiring a HAL.
-    if mmu_version != MmuVersion::V2 {
+    // Hopper+ uses NV_XAL_EP_BAR0_WINDOW instead, requiring a separate HAL that
+    // has not been implemented yet.
+    if !matches!(
+        chipset.arch(),
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada
+    ) {
         dev_info!(
             dev,
-            "PRAMIN: Skipping self-tests for MMU {:?} (only V2 supported)\n",
-            mmu_version
+            "PRAMIN: Skipping self-tests for {:?} (only pre-Hopper supported)\n",
+            chipset
         );
         return Ok(());
     }

-- 
Joel Fernandes
