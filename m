Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7435315760;
	Sat, 31 Jan 2026 00:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820978; cv=fail; b=JK/r9tE3KltJ9o4Ys3wKYrTmydqwfEvVWLOL5Tp4rE5uFSmMtG+I9FAbTQtvgPUOdK9vGDKJsbf2deiCwJh33d7pY8phFunVMLg+hm3/Ipau5nBQ2TzjaBeievkIoHhoEyvMTvqSpmLGoolMKUEiK3LAIIiorYycA3prAeZwJXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820978; c=relaxed/simple;
	bh=BhXcKHiKe6QGq4vhNBKdtALZM5NP5ROr666SiI8P1Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uCO3yUXESO2oBpraLbCuY1r2cFoxComv05QiameoDlCyvAlb9j+1eFJWHRPvy5Y0EoeWWPaMXhAUcCLfDEDBkLPCYpQyNpi3O8QzQ1i1Y7SR3+eODBiwoXh9WcLJJUv69qPDxHbvRAKNELUdMc1vtUdB/8T3VGsAhmY1u0r/MvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JGHFw+73; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JGHFw+73"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fL2cjelFtFKi4hm7+UcnJmuCjsZv+WuVz0uy+BEnv9vE+qjtHsVvDg3QWH5VOPjX8L47AIuuQu8SFFwK+aDg7ZaM2AojKPBytarP5hxhLT3s4JuXYwCeYA04CRRQqz7DeVdYvQZ8QNagIoqbFt9YIFFYTlCaRsZzALmFbGmUT4z5KUDt1ZjydrCOT4FKPUQxbUGjNW2vdZnA1ZI1IHSc2L+9OnIeG9TwbFx0YBwcSfJp2FRB7Wz2FPrkHU5GGi6zxwo0SJRCY76hmGeUu4USBOSQQEnesMiCXBKNX9hTKazjGD7HdVuhtZjMduALA4jhxov9PHFxtL+6F7FHCSwl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NB15Qq0OuWCwSUcIFZO7qYG1ondlSs1xUy2mSHDnIXM=;
 b=imp88xcr0OPA5IHEIAa3fqA2tvKETpEe5tn/re23hifuUs/SAr0TsKGpJYlh7GHUkDDlQgiwVo4sI5/fz0pn0TZpOaWr7mPUhGa9POlqi6duczT6ZqKGeMwnV4BVGZHMZbsSDjOFqXuLlqs8YWG+9AvEmMMkg7+9iBVj6aXJm8f8L+zrZPmhxELTdBwJwxvZOalQEf6xTIbSjYi1TIf4WomJba6IadY1iTG6o1DYOLgb9HtOKgHHcwf5/gBDbpBp7hZdnspFWv1gULUOcU+4CwMkdjY4qydnA8TilZ/cq9pTzZkZtm8Rrt53dvgInFJ94A08dp/5vHtGSgaEgIzDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB15Qq0OuWCwSUcIFZO7qYG1ondlSs1xUy2mSHDnIXM=;
 b=JGHFw+73GcBLuIETqcNw6wn9LGL44/0Nzr/3iBVUtAvTuw2pE7jGYpqiV7PpMvjLrW4p2Qm2ohJ7M7h8wgBRs7fTtzUy9mKAWgGROywqdGGLNhuro9fSOuB8z/Jq9577zaTlzE3m/8PJvH/Av631bW9UuWQt1ElY2vlfVqNoJSiPd/KVb7QeagtGuahKaznZBT6T/OLNQe8GVJIGazdLlNzm5+rjMqE2hwGVKUYzhBZuFaxud6wsoQCy4nWMRxelDzE751qZsdjNGpEDevcXF96IvdhuyJJPpQ6EZMlqHoUmqBmVlgjVKh0BHcPt+nzuRqLeqWl0NDKv39ka2p11gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:09 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 00/30] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Fri, 30 Jan 2026 16:55:34 -0800
Message-ID: <20260131005604.454172-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 646a5493-063d-4d94-b504-08de6063858d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SF4MtpToSDVxyIQCdyxUK1yXrrlrDnr3U23AjOvV8GFNSAesRmExjRkT2R0g?=
 =?us-ascii?Q?OT3hNRUDFq6yVaWjKcMXPlv98QcL8K166I4+BZzgBl99m0r9YsVXFHcHs3A5?=
 =?us-ascii?Q?zu2fqP0RZ2ly0QTuUGeOGB9JIjcngaxGSot6TMhlf0fXNYRGgpQ7lPOANp8c?=
 =?us-ascii?Q?TB0NgHPXF+YHQjYUCA670Ci7im6/zYmyQO8iEhOG/Wpx9BvbWV4+GzfSrt6B?=
 =?us-ascii?Q?x35Jvv6TiyTvdvjoBKnrx0U+PToX69nlAt6dN89Dp+3ALN/Ywmx/MGQiOQRa?=
 =?us-ascii?Q?iNCHS7J7OoYFhXwW5kdhCad88Yb69oU7kr4u2NlONoDYY2z3+n/wUBTZiXys?=
 =?us-ascii?Q?9dcRoU8GYsUnbAJFaFZ23Zjjh3dHlPdOkHCxmBi0+dfSsZNvh9gm5rjOJfaw?=
 =?us-ascii?Q?qlGDcnD6ctg+WEHyFzm9AUrmZELRHves29wwhTft5X87z2myknbDqZeogY+K?=
 =?us-ascii?Q?zSrUr4k/xAWI3pG+TCDQ+fWrxpciLG9/AA8JQCwoqGktpG0FJ81KdDXO6V+n?=
 =?us-ascii?Q?7yblxlCphl9Gp4tgTyTgoTBs+VHPDQU+PKpuLRKjva3m8TcbiiE/MoOl1oRV?=
 =?us-ascii?Q?JLqfD+0jaexj7Mbll5zxJeMNL89ePQxxTa1kHJn2x/w3JMRfOndXSEbyGpts?=
 =?us-ascii?Q?GRNKuSfF/xREYLspzU9MjMBeU/08ngoPWvrKgOpbGyqDOPCOY/EBE6VCqRXv?=
 =?us-ascii?Q?zurWasfZ8XV5JAG0wfXobXQaoaCfq4Uv0M/ML0zFSDrHSGvzVZGMFO5TywJ+?=
 =?us-ascii?Q?X2ilnIz0HvxHJDOUI1oZuMbeNgTjYNbR6ndCSIjcvln/pdnyHKDSBhSxZzKQ?=
 =?us-ascii?Q?Az4+2wgO301WdKVHNStaF/gg3HRNXIHYfIKCyvrXAy5hUUf1kEyXqi6sKs9X?=
 =?us-ascii?Q?PsudIRlotkH4a+uI4bVQ/j63ubab4qBObawdsN8sQ6J2Lp0KXLUNnG8nig2E?=
 =?us-ascii?Q?YSsP8GImb+y9N1nxkqIQONn4DKnq9YFniYCcD/ZI3a7QZ6ssQZRNtVwFxWGu?=
 =?us-ascii?Q?PzEImosoovg0Cl0/b/NXOcvDxrvL+zVtgVRU+V5xpGPJIQd/1u5JN13LFNZj?=
 =?us-ascii?Q?pdk2CLDsB7qfLC41J5OnxsGm5McetmOqwyHlFMtATTb0pE5d8EbXND0jVGtX?=
 =?us-ascii?Q?EpdJoM8wx7h2tLNMo/1GZaU2ZPnVwqT+y+QlCOGygfa3SGyD2JWLAr468WUt?=
 =?us-ascii?Q?9oz4BjBSNNjMvVMgadXPUcraToXk/YpBosz8+CXwj/HvrfZRV737W8/JCHap?=
 =?us-ascii?Q?Y0sTxt37N2bzLXO1T0NswVK8NyeYvhUtgtePyqBfD3n50SePkROD9nlzZb9W?=
 =?us-ascii?Q?0CvMBkR62jSRrxALwDQcMdXcSXy8D1oZjNDSX4+9m/++ZquYBtBO5RKPgfGl?=
 =?us-ascii?Q?r9fVwfs4pmsRsgqDT5I47oola81OYC3b9RZ2nWeo27IhZsd+IkHLPu/1dExm?=
 =?us-ascii?Q?zTlavj81ij61DZdttteF/dv5OtbgsLSniJbfujnrLIIH5PN0rP9X8K4W1hTm?=
 =?us-ascii?Q?NYaMu9U0YHdpqL8arhVXYaL/k5Da197sVTiXfobvDoPcOSyFYFemdzNUx6th?=
 =?us-ascii?Q?eJTs1OgYZpMAo04RfLU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YT6gsNmK4a/qqxNTxvLYBwfyy9OktPrNUzmazvQaPhykugdaCyjOeyhb1Xfy?=
 =?us-ascii?Q?fDTm3gIkD6CFoMZcxI8r3fjfe8ze4/TEx6WPWsDoEiAdQ5xsuiA9optWXvKm?=
 =?us-ascii?Q?RZh8v2Rsfj+tim6LGCOcf1Ed4POm9xgs3Y7eRjx++rKmYV1eFKt+pNm7X6es?=
 =?us-ascii?Q?iykebZymfi2k2it2ne0m7Rum4meUeeBuYtS1juYfn0ZHGKUJ0YsHdGAqmQO5?=
 =?us-ascii?Q?yAbK7t2lwxifAO/wkIKIQNN/+AN5au8QVr/WwN/M4YLtmiRASfYaZ2VwO/ou?=
 =?us-ascii?Q?I05K1D6ZLZ0hu8m9Uk34flP15LcMXUng2q9ZyeIER2NVZW3FDQMDE6XtLrJ9?=
 =?us-ascii?Q?NIgG5tgQIWQqQ7iK1PqCjRZ6mTOU+Amc6GB8no0KEbOxTig+Pa3qikcz1ZcE?=
 =?us-ascii?Q?zUwrsvyUYzN2EV2AJqNnWVxDXDiKNjQNYgmh0FG8X8MWseaB0zwDSFsPx70h?=
 =?us-ascii?Q?C5HKhgTfnulyMmg5qw/kcAJhp2shPfQYXEJuTKtkdRpo6r3PX0tnxfVp/hnG?=
 =?us-ascii?Q?Qhq6d3mOD0uZ7pOFGeRy5sGOuSNRFVNmjSvgXxS1TKxImFeqiKK1kBoauWRw?=
 =?us-ascii?Q?Iwzf//b5/dsQ9n0eAaVLIfH/Rw6Pb/cWTqGMvC7dniyPpVU1zKTPriY9UwPy?=
 =?us-ascii?Q?g3KblNDU5uQ9elmsOUti3oCxgIKtGLP6k7iueXdZvZ7tJAbl5HpdcRi1YnuN?=
 =?us-ascii?Q?ecDRLcX/5joByDBwRhxXIm5u94MvoangE0bhOoMfTjIPGb2Slh85iOQvjFaS?=
 =?us-ascii?Q?l7QfbDLt2xhI+iihtl813VnQR3VkQFAvJq22LuH3Xk+7kJECwdpPrUIyEXm+?=
 =?us-ascii?Q?L4zKkmpvUoPX0D80Fau+2F8iv2mcMPntHz9eUpEuErwFDAIbX1aV+XdFxTwt?=
 =?us-ascii?Q?HGkvfSoY7VfIrQkgpgFB9UrONAhwjvae3rcXH2KnlTgDkBoCQTj5ZrPtr2iY?=
 =?us-ascii?Q?5zw6tsAGnHmkjxSmWW9kpAakP2772L8u/ggSAgGzYJlET6z2rxe7VBVaou5O?=
 =?us-ascii?Q?vaW2bOsXgcT0EkTzj1QFjgpJbhgxlEHFzZOWtjzYMMc/Snot9BNj0Kecpo0C?=
 =?us-ascii?Q?as53fq4341sb77mHyTLE/XA+6CiwJqdA6SJRxT7gxg4hz8G0BVtMXJkpxAPe?=
 =?us-ascii?Q?IdcnE45i8HgB1yfOYSV7/jSRtUzGX6clpLVrs3xmEnZ+u41aifUeh5n9nsIN?=
 =?us-ascii?Q?53WtIoijBW+yPLr8/ejkyJmn9/Kq27I9zRpvDX+zA9PWYPJ39/E0+7cWekeH?=
 =?us-ascii?Q?V0A3sMao3RlFToMKPi3BzJzDmSQD9lArvKlCWOh7+9UDai2ReHLdl+58PHNf?=
 =?us-ascii?Q?8u/ba4Ry8x6dHuyeoxLZQg3f8ScMpPb5HFFzg6r0fH8M2nu+RYpIFI7WZ933?=
 =?us-ascii?Q?mptrxh+jWRdKzOH56zLlDpUrHfhWiSytM+tgcRwIlCiLnuxe3lhun78hYAMN?=
 =?us-ascii?Q?78ancE0jvCHCPLGpb6GYqKGq0vkQU2YVOydUJuj0njX4VMSeN2DTIB7HfZFk?=
 =?us-ascii?Q?I+zz4vMCn93PdmPmw3oObAiQidwOb4IlEXuZ0OWFT84/wm9PCwDB2tl98sP8?=
 =?us-ascii?Q?4WJzzY/jlAf+Lcu5HyksoC95dmrVPnWIUUt2dHNjCnCiiKp41lMtOigCxOBJ?=
 =?us-ascii?Q?AuC6pq8DerYSaB8ZIVJp9EI3h+/i86SbxaEUQ5ZMDsMwUXEaZPgUJLmKDdIE?=
 =?us-ascii?Q?z/jmbbu4f+icbGS0MOEo4QiiyPa2xNXJ3ixh7OduaR0Hf261kY/gDxAlCYCQ?=
 =?us-ascii?Q?dAM+ycTz9Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646a5493-063d-4d94-b504-08de6063858d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:09.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjkeDbt18WOuMmwnDQB9NOdVzztzNUPIuqEUdKEhK50sAEF4/HxF9M40M1qWzuBmvO718o8cu5JX9gBGB8qf7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Hi,

Thanks to Gary Guo, Joel Fernandes, and Timur Tabi for their reviews.
I've added Reviewed-by tags from Gary Guo and Joel Fernandes.

This is based on today's drm-rust-next (which has 11 out of 13 for
Timur's Turing support patches), and re-tested on Ampere (GA104) and
Blackwell (GB202) RTX GPUs here, and it looks nice.

Data center GPUs remain as TODO items: GA100 needs some additional code,
Hopper/GH100 might work but is not yet tested, and I haven't even
thought about Blackwell data center GPUs.

So even though many patches say Hopper/Blackwell, there may be some
test-and-fix work remaining there.

Changes in v2:

* GA100 (an Ampere chip whose firmware boot steps are closer to Turing,
  than to other Amperes) returns ENOTSUPP for now because it is *known*
  to not work yet.

* FSP: use the new Chipset::fsp_cot_version() method instead of a
  hardcoded constant. This fixes a known wrongness on GH100.

* Changed to a HAL approach to handle the slightly different non-WPR
  heap sizes, for Hopper vs. Blackwell.

* Return Option instead of Result from get_gsp_sigs_section() since
  the failure case is simply "not found".

* Return DmaMask directly from dma_mask() instead of returning a bit
  count.

* Change fmc_full from DmaObject to KVec<u8> since it's only used for
  CPU-side signature extraction and is never submitted to hardware
  (only fmc_image is). This eliminates the need for unsafe code and
  the associated SAFETY comment entirely.

* Use as_bytes_mut() instead of unsafe core::slice::from_raw_parts_mut()
  for copying FMC signature data (hash, public_key, signature arrays).

* Refactor wait_for_gsp_lockdown_release() to use early return with ?
  instead of chained .inspect_err().map().and_then() pattern.

* Removed many dev_dbg! statements.

* Use IEC binary prefix "MiB" instead of "MB" for memory size output.
  Also improved display of small sizes (e.g., "24 KiB" instead of
  "0 MB") and fixed a typo ("suprising" -> "surprising").

* Reordered the "skip GFW boot waiting" commit to appear earlier in the
  series.

* Series has been reduced from 31 to 30 patches, because the "needs
  large reserved mem" patch was absorbed into the non-WPR heap size
  patch.

John Hubbard (30):
  gpu: nova-core: print FB sizes, along with ranges
  gpu: nova-core: add FbRange.len() and use it in boot.rs
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  gpu: nova-core: factor .fwsignature* selection into a new
    get_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections
  gpu: nova-core: apply the one "use" item per line policy to
    commands.rs
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
  gpu: nova-core: move firmware image parsing code to firmware.rs
  gpu: nova-core: factor out a section_name_eq() function
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
    of FSP
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FSP message structures
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: clarify the GPU firmware boot steps

 drivers/gpu/nova-core/driver.rs          |  33 +-
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 163 +++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
 drivers/gpu/nova-core/fb.rs              | 118 ++++-
 drivers/gpu/nova-core/fb/hal.rs          |  30 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  37 ++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  37 ++
 drivers/gpu/nova-core/firmware.rs        | 186 ++++++++
 drivers/gpu/nova-core/firmware/fsp.rs    |  47 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 138 ++----
 drivers/gpu/nova-core/fsp.rs             | 564 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  87 +++-
 drivers/gpu/nova-core/gsp/boot.rs        | 337 +++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  61 ++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  32 +-
 drivers/gpu/nova-core/nova_core.rs       |   1 +
 drivers/gpu/nova-core/num.rs             |  10 +
 drivers/gpu/nova-core/regs.rs            |  56 +++
 21 files changed, 1704 insertions(+), 264 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs


base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
-- 
2.52.0

