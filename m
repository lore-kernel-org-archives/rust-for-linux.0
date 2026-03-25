Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808E03C3C1D;
	Wed, 25 Mar 2026 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436112; cv=fail; b=mZBpASEXyOtAlRDbu3mI47im5s32sbkuwRslyq51ayONZM+gUWzoXCtnXfRAiin56uecZ2KQp8LqBw+2gfZeIY4H3gYY1o4SD5kcm/2l8Q1Lm4/o4XlCnM6E2GY46tHaA1tAOEtuV3uVAIaIxl/OhtbSjj215UwCvqvgzzy9X+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436112; c=relaxed/simple;
	bh=cbPaQ84mmGUFDRWYENClDSva7ZdrMaPRBdeL4yPHuHI=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=pc7nHjCk3YdJJpuoW45k3+S3eMVNR/RjISEJ5BOlDZRESSHioJYbgacvY/6+xQIModi3R4Lfra1HPR3S/WWJrDxCsQ32S7m+uSdua3PXruYmNwD9fZyw4+Ezai5GY/FuILhgoyr9OynndpNlzQaAveEUjOQ3uZ4nHokJ6W0t0hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pyn3/Ucx; arc=fail smtp.client-ip=40.93.194.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pyn3/Ucx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIYOW4N6i9qZUF4AQbicqK2kwBbAlQCtphpvRHMTM5BscwdTddhduOBW2N58MFq6eefV5oB3q2LhJJMkVWlkGKpmi6JHBjXSWU18Ok1pOiY0sMiKc3J31Y/ia6G2R/sockhUifgzhl1R27ynrZQvcq+53lFP2xVRerGsxDagExKQo4nUcyKqRbyAtj8wzKxGFxvtOCww2ylaheWxJbObNlHWJJSZvXCA9CrgfmgLh1EEZOnPkGHZ2LcrRAPnnlqXpM357zkW/+4kKcW7DNazXuX2hazAtA10p8ohdAl8d4+J07qq8eZy/IUCEihlgvA054Ez2ofL5jX7EJty0CTOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTGySCA/TWHhnCNc3zEg7uJJZWU3z6HTM7cbQbi0bNc=;
 b=WdFPoLjqo6b0gOlVUjY3w2JDslWLdhKwJ+3IY1vGs+XknS54+0mkBGOdTn+UpAVi8OIMR95Tm39Cpytr0/8B53/gCc8uTaw6U/4NxUHZH+z8BDQ7MWOTrO3LnnbVCQ5QhP1WasQBfr+gUm0IMnxZ6HUJcJSsVN7iWMqO2ofDdh4WaYzCwYsMr/b++3EC2oKvZ4SmRgQ8eEwqBvY17K65Scp8InGUdI7cehfQfeP9t+FXs4RF7EDNwfKCohOAUDa7mG+RKlQQxF1Ll4HxUcRPDaeb4btkbu7iqkcmO6DbFyEr09t7Y3W+CuFsE8avnMyw74pB+tgx+l4z4wVF7CazLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTGySCA/TWHhnCNc3zEg7uJJZWU3z6HTM7cbQbi0bNc=;
 b=Pyn3/Ucx9abNNWl4GYKjj33EuynfiOqsBG/ubikaR1ZRD1UvY7cNR4jDBME1C7vQGmG4P2auoTUOEC9+3lJ59CrWO8jqtZOjj2WZVALfDYwpkfR6xm3Y5XyrOC/7cweBvhZtlu0bbmq8ohPh7xl+YIeWblRQM5Ge3AYOGzdtHvMCN29C7EQ0az+iKmpCTW9qSiOTAH4N1nM4Vj96WBa0IjS+IN3LZFtvZY5YRdtn8w5NwxGdlmnLK4/f6Fm85SHzqwQBUQbjSdD4zVPbe3tdd9ppZlcWYxsuFC1bJwigJsGo2LLeB385QWvx9POYogiXS517JaLNkmuIVkQXylbm6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7291.namprd12.prod.outlook.com (2603:10b6:930:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:53:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 10:53:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: Alexandre Courbot <acourbot@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20260325035242.368661-6-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-6-jhubbard@nvidia.com>
Date: Wed, 25 Mar 2026 19:53:41 +0900
Message-Id: <177443602196.105362.15426109878373353153.b4-review@b4>
X-Mailer: b4 0.15.0
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: a85be412-e849-4cb0-c257-08de8a5ccb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vv3O/eVE4iI8EAg58cXij6YFuMUAfmtndsGRK67YpZB/Eg5X0UUnQrmzhVWPteZEIFu8973q8ev3a8EgMvCpaggHo8M67rhM6JUiaC/Mb0AoYhwWyelgdiC/B96V+nmLXwRdcR3UuUBxAsaspWBCAXKCem6YDJfk4s9cVgyMNB/lTtPbaUJyIuB17A02akVC3CpI+FlweSuG2PqQdfTQaeF8cEnlFYXsz0g6ztthT+UMBHGtUJ9WnK6z1YmJw4PrI9EKEU1b6Cv5WaZqVzE+IFiJ4b8pASGkZYZcYZD52tJVAzt//wVfWweZBiYQEjrvvWXpAXjIYK4kDhWhefTyOS/wc4+nNV4guCk3LUOK5ODR2IbVumxTQ7bP8pG9qRlG1H7xMevIVY9/cSpVNtFesFgQw/+gQd1p4ZSoHGVPd0gPkWXXjEzJwaeOFrFRQp3EEPTQWVS/5Kr0s80oUxnkL6sgIF0meq+x5VjsKtFzzvqEA9YKdnf7dYESdeDwFbD96/5zY9cEnysbptAXYwqXkzR26hFMpgvrxfi2yu3WNMMaB+8w1FrwnqX7dyNRA7bKncdkP2sB31EgAN9GAFiATdja1E/ZHPzrYXvN8eBjHLJmgJ+IJTifi9nCdLizTiX1/gVM7821aphTNb0lyaCreLusnVWdUzIfcVAsmwBlyTwTnjpK4djvy8BpN6JQBaHEeHjg3EY+bCz8OxJgGG8Xufun0Hdh5cTUfR1ENoCO88s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXJxaU1JNG1ETlR4SjdraEJWU1gyZTk0dnp3cmxQcmRtY2w4ZVFGdTFnbndD?=
 =?utf-8?B?ZkFzNHM4L3BiajRaeVo5djFxNzVTb2xkUlhEUFhtZUdtVnlyVUYzazUwd0Vy?=
 =?utf-8?B?amdlTWpHM0l0VkNJUjExb3I3L0o3cTFtbVl5N2hDU0tSTnY4MFdxczdwelpl?=
 =?utf-8?B?QXAwZHE1a25aM295RWhBRTkyTGIyMFVpV0JqZ3pWeVVGU3o1UVMvRlhSK29z?=
 =?utf-8?B?NHZJeFRMQ01vOW1RdHI1cVpoUjZIcjdqT0F5RFFHd0w3S2dVTHhKOFhXWTBi?=
 =?utf-8?B?Zk9zL3RuTHJySitYSHVxUG5IdzVmdEVJaTk1RVArME1XeFUyd0VzdVM5bW03?=
 =?utf-8?B?c1lOVHNFbG5OTjFQUUxQeDJsRm0raHNsOWMwam5sSGdvTVZmbU9xcjBST2ph?=
 =?utf-8?B?ZE5FVWZrZm9ielRhbnhuaFpDYnIyTysrWjVzRjBlMG9RTzE3Y2U4c0pPSzZQ?=
 =?utf-8?B?N1V4YjVtUk5ocHpxNW1iZ2Nscml3ZEp2MlZhUk8zdE93N3BTWlJYQW1RNmdm?=
 =?utf-8?B?TC9QUFFqN0Y5ZXNMR0tIWG5SYUY3eEZnd2Jjd0VodTdQVTIvVGNhY1RvbnQv?=
 =?utf-8?B?MUtHbWhuZjkwcXZKQlh3eWJsYVh4ajJmaDlKVVZyWlFYWXRGZGxLdjBMbDdk?=
 =?utf-8?B?MEZoaSt6UndodFlCVkxaYVJuNGMyUkt6cStnTEtSS1JkOWw5c0J3c2owbjJX?=
 =?utf-8?B?UGZnZ1FXbGc0MWRGT1ZQYUFpVVhrdDJSWGwraFAxT0tDQ04yekFyQWNuRkRw?=
 =?utf-8?B?QlQzei94VVRyQjZuRlZhQjZDZXJlTEJTK25rZnJ1YS9tZjJoV3JHL0YzM2h3?=
 =?utf-8?B?ZGRMWjlINEtsdUczZkh5c29scCtEVUlzbGx0eXptV1BpN2RKZ2tjakQxYXIr?=
 =?utf-8?B?bEdFaVVJU3Y4SjBSOUViY1dWUVNHdi9IbXVWbXlSU1lLa1BteHlMRURUd2gy?=
 =?utf-8?B?T1diUTdMVTVaUnI4a0RYTVhCaXJtZ0dpeXVjMDlzM2NzVlBVVFhQaDFEOVk2?=
 =?utf-8?B?TUZlL3N3S29JVW5NbWpVVHF6cmVuQXI3bzA1UXI4bGRVWEI4TFVSMUhqNmk3?=
 =?utf-8?B?S0NWQjRoTkZrNXJhVFlhRC9BLzlXVUR6SDh0dEVySE4yaWdHTEpFQjFvYlBn?=
 =?utf-8?B?T3VLZmxiSWNTRjBMVTU3SEVBY2NTY1kzN1IrQjdoQmc5dW8vZHYvTDZEcTRN?=
 =?utf-8?B?WURnSmxGWmdOMkxIR3dhTmVJdEZtMkYvMHZ1SFNodVEzVXAwK0l3MStJUmJh?=
 =?utf-8?B?YS9DdEh4ZHFyYmx1WnE3YXRxUG5tNkZEL2E1YStIVXkvQUxQeU5YRlYwZWFn?=
 =?utf-8?B?eWE3WTBldzdUeXR5bG9QOHEzcEExbVIva2VIMEZ2OHZwZ3RlZlZOeklhd1Z4?=
 =?utf-8?B?VmpHV0hjb2NUWllRRUtZRGZyU3lOTmhQZ3RhSFVzN0lwUUxWQS9DYzNlRmdC?=
 =?utf-8?B?MGRXWldza2s0bFNsL1l4RDAvNkZFOTQxZy9OakpHWkU1MU9sRlRyYlNFcS9B?=
 =?utf-8?B?NjNrNHYxSmVsZGZtNkgxWUpiV0IvV3VCUXdlTFlMN1RhUXhaQ2FXWkdZT1pi?=
 =?utf-8?B?STlrZGF5T21OWXRVSnFWNWwyMDNITkhySCt0bjZvcU1Fd29uMGdERHFaTW1H?=
 =?utf-8?B?cXhSM2NTTXVkK3ZCcWVoVDdEQ3NXeGxQREEybVE1NVVuL0p4aVR5cHoxKzU5?=
 =?utf-8?B?QjBjU0tWVzMzZC9iQ2NoeHBRUXM5UWVhcis1bWdwMnlzWmFqSk03dTVDYzAw?=
 =?utf-8?B?dlVCbW4veGp2YVBDQ2E1MUJ4Qi9ZZW5DVDltaE1FakpaaWt1bnYxc3d3aXFI?=
 =?utf-8?B?TEovZDFWeUJNcUVnY1pJUUFqK0k4SUtHRy82VGJRT2htQVV4STRDclpUcHhK?=
 =?utf-8?B?REpXUzdCQnhzb2dURTVCREx6TndLTGhnWWp2dmNwNHVYWDZ5V1l6YVgydWlG?=
 =?utf-8?B?T29NcWFRc0pONlYzeStoNFo5T1N0dExZMTIyWkgwWlBOZFp1eURMUnVTWmlV?=
 =?utf-8?B?Qng4WlYxSnRkZ3JleUQ2TDljMDVVMUhxdElFdGh3OU9JdU1Oa01SQmhwVFky?=
 =?utf-8?B?ellnSS9zQy9rZ1dzNHhUM2Y5M1VXS0RHWEI5Snc1dlRUM2h4aHUwcXhhR1BE?=
 =?utf-8?B?T3NCa1BTZlpsWm1CL050NFF5MGk1MkRrQUdNeC9DN3JrL0luOEtEZEJWVU8y?=
 =?utf-8?B?ckZzWEF0ZFowdUkzMm1YR2t2cThzWXJWL3huVlIrNnJzRFZDTnlNTHVXM1Fv?=
 =?utf-8?B?M1Y3Q085elpqMnltclVEaE5vM1dlYjJlRW93NFVYd1ZLeXlrNmY1azc0R1VV?=
 =?utf-8?B?Z0xYODM5NUpFRmxoMUROeWhHYmx0N2xDMXdvdFJPWTMwR3VJTmh2Nk9EbnRK?=
 =?utf-8?Q?NdWKSrJ4S4iAF2Jy+JnP50ujlaewjFoX4jCf24Icj3qgK?=
X-MS-Exchange-AntiSpam-MessageData-1: ScQOhDY8j8Rg0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85be412-e849-4cb0-c257-08de8a5ccb65
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:53:48.8981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7G8BPF3QqpexcYPkd9QbfCL8YhBOT6Y1s6hQGyimn1CRt9M345T6KVvhX4jKX0ja2hWlYCIKFgSUyTQ3Np8ATw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7291

On Tue, 24 Mar 2026 20:52:16 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index 84b0e1703150..41227d29934e 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -84,18 +78,20 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
> [ ... skip 13 lines ... ]
> +            dev_info!(pdev, "NVIDIA ({})\n", spec);
> +
> +            // SAFETY: No concurrent DMA allocations or mappings can be made because
> +            // the device is still being probed and therefore isn't being used by
> +            // other threads of execution.
> +            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };

To limit the unsafe block to unsafe operations, we should store the DMA
mask into a local variable.

>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 3cd7709883be..e7c3860cfb28 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -162,6 +163,16 @@ pub(crate) enum Architecture {
>      Blackwell = 0x1b,
>  }
>  
> +impl Architecture {
> +    /// Returns the DMA mask supported by this architecture.
> +    pub(crate) const fn dma_mask(&self) -> DmaMask {
> +        match self {
> +            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
> +            Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
> +        }
> +    }
> +}

Eventually we may want to move this to the `Gpu` HAL, but let's do that
as a follow-up patch if we find it is relevant (which I am not sure
about yet).

> @@ -295,32 +306,32 @@ pub(crate) fn new<'a>(
>          pdev: &'a pci::Device<device::Bound>,
>          devres_bar: Arc<Devres<Bar0>>,
>          bar: &'a Bar0,
> +        spec: Spec,
>      ) -> impl PinInit<Self, Error> + 'a {
> -        try_pin_init!(Self {
> -            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
> -                dev_info!(pdev, "NVIDIA ({})\n", spec);
> -            })?,
> +        let chipset = spec.chipset();

`spec` is now `Copy`, so we don't need this local variable anymore.
Removing it and accessing `spec.chipset` directly simplifies the
remainder of the diff.

-- 
Alexandre Courbot <acourbot@nvidia.com>
