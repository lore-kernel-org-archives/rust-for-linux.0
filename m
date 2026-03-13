Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010034.outbound.protection.outlook.com [52.101.193.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDFC33A716
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 02:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367896; cv=fail; b=oNUG53jXzD9o+vJTWu9WujZrNDRwTJj505RZ3Lx/mWA7JPAnPzW0Rl8mPxvhI13GSOxFDp3TqvG/ImXkWlQ/GdzfKHd8pI4kv/Kg8L3u83gY8YLIUAWKShPt/25gncRTtfJN9tpqvjEAnOGX9rsy81uhGyvp3W/zBMYSOenFOEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367896; c=relaxed/simple;
	bh=vyZnhXKsRS6qPL3n4ctXUKNfhgxKN7kCtvbApILrvA8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=J8jZ91Xm4kqGVy6uHH+89uv66UJsH23zmW9SfTJ/B0IDdw1lXDdOJtMiGcHYwOEcldIyN1huIGc8TcWNO8iuZMgvrFpu0QPh+kcRZThMjEqZ8jRQf3iT+e6/dUreT/a/kOc2R67Q+lwsIY14AalQ9bIV+JdT7NnQI3q2LPx0yPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j6lXtGYd; arc=fail smtp.client-ip=52.101.193.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j6lXtGYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7qJeUEPwMv7Y91JH4B+y3CdDjc90xp3nY8LjtmQ1Qsd2Adr64kZP1PEi2lg2zZhgBC6xCDlZ1VFrl1440m47R0850aFhAHIcOGgRLMr3Hi+yNshPIS3e2EFRhx5VoIdPmS/pFF9U/5VZ1qAgHWENiUR5iVkF419Th8rkrK6VYHML3/IhYAfW5u98ovB0geRTlbWWbs1bnDYTLgZEY8caM+jliyFqLEcTJ0N7QTXhJFFAIuS+Md+vvSe0xuoK5vNtPMiI39JWenqT3Ra88zBTeiQSsTCQ87Te7gEfc2yaulK7/rivmzXyh2MiZAbqIthmzLDiBrcfkaBu7WjPKZlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yR5xOIMqrtYmqWZhUSDYJ9/PV30d+UGhrP6HqvHBtk=;
 b=doT/Fv54Np3xWRlHU8I+pKTlTWaUzqmzKs5h7fshTKIoXrAsQqfz3FhohTwbVEZROh/Pw/YTs18fVYw+pzh2A7jhKG6NCT+lgrDWphzMm4LVwySIuHbfljqT+lWm7FlSiza9FWxub/zP86M14AjFUyZSjeJPs4DBzLlikEhN6hR0/fZZPrb/XMWfNrH0j8ylrCVMuoRnERwO3bFg47CcUF7TWlr4hEOJarkqTxMaZlNQ/qyhvts7rHtYuigrdv0XZZX2L/ebbFadZoDizh7IhsHbIajV/7RJrk8dp/8iQsU8+2bFaXcGx1Rr4ETXcCS1+ey8+ISuRYv/r28pI5rXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yR5xOIMqrtYmqWZhUSDYJ9/PV30d+UGhrP6HqvHBtk=;
 b=j6lXtGYdlu54yogX5UfBPljPyIsr0lpfFaHH38JVNiI2MtWEZitryRT0ND1IWIM6Yoc6XKN1zQh96IdRBIWb8VSYtEXga8Y6cEPRgOBNgB+CJu2xtMNT79EzvIvi3z165pT9ckEkmoffhQNoOpgR86/WvCm+2dW4ykE9wwDITa7EBMd4DwT3eVmFkHDm+83WRFu/2CjcfUwlnU/uZKxAHYb84KCIAVOUqNJIrugzD/1D1CwrKCBbNAfSFCdDd/lIR14vFEWvHOYAkSKI+xb9ZIi1m5twbdNCAr6MR+N4cBwaIoODPYkZhdsS3ORFg6lpTotCbFn1AoAkCW1CHRuwdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 02:11:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 02:11:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:11:29 +0900
Message-Id: <DH1AG9IDZIDO.2610KTTZ29MVS@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 <mmaurer@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-4-ttabi@nvidia.com>
In-Reply-To: <20260310220000.1897166-4-ttabi@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 93004267-73b9-43b9-4172-08de80a5d86e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WKtFPpFCdG4dHjdX5EEy8gMWrm8zmM6GSKWgCQllQN1BKdpYeEEt6BihxH0uXPBreaH11eXMeVViXZ8k1PwZVLVIaGS9KByg9X1kDKarqqKz9JclZeVnHL4SiM/stR3BsEnBEASQmq1krWEmZ3wfFgRRRJwPHSAXCci8u0ZxOw/AEg3CsZSGqKApMiuGJZ71gUyKUfnUTBQZ+hKws3474XkWex4u78FSB2c+FEnq8jew47YhVxhRVbX/3Y8h1p+eVDOJTT4B0povxN9tHi0tLqgiZ94WAgfJkW0QaDB1rT93cYtX587lzg4wClmFkp0Ai4/5qRZv17ZOF7W/2QoaBpowrxgTdA+uTBqmW6xu0FjOrZGWA0cXPQFOeKnx5v8sZ003M3tYmXO2NjVWYDiXau+U5cRpfOxK29eV2c1tUXy/Q1GWhi2mhHH/Plvb/NgasNLe6pWIyDnvwnl9TaLMJbVLN5hyzm/Ft8yfT6tXePUcWt7/ehsVz5b78GvuxdDZb0/iqlgyRAyRSh8vA+pIQDlmwG2AY4HW5Qr+nEz6dvVttIq37vQWKqWIUb1rF/qenbjDIPS6tQZL1T1hd1e9z3HZTXmYV4P2noOrrX4poyO7W9ikvwEUqNX2VG5Y7fmYVb2A+buDbz+MjPCEAF/9O7Du5DGcefwj74ZzpyGi2TeEz+xTBUdptECmlwTBIqvjSxjbEdAAgQC+L4+3vPcYHysrPgs47JriQpEfcksEUQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXU2QWhFck9VM0E3amdvb016Y1VIVUhNbTM2Mkhzb2d0MjVraTJMZXJlNmpw?=
 =?utf-8?B?OXZ6L0d3cDBxQXdFSUdyVUt6b25vWDN0bWwyMFA5TFlhSWJJUU5kNUN1eU1J?=
 =?utf-8?B?WkRaSlh1bXh4VG1HS0lTRVorSlBSQ1RrMk0wNVFjbVJraHQ1VkprRHIvbHFl?=
 =?utf-8?B?bGNHZWNDUmcvNkpDSU5CNkxFYW9CaTQ3UUxkNlQ4cXdEdkFNUHZTdElIS0Fk?=
 =?utf-8?B?TzR1Sm9Jell4dEs5aE91bWFpQmc1SUpwT2xSbWtDQkhpNFFlVTRoOFhmV2tG?=
 =?utf-8?B?cStjVS9MMHZvZXdMOEI3dFhJcEJIbnNJR2h6N24zTCt2RmljemFHZ3hMcHYw?=
 =?utf-8?B?c1BjVS90NkwzcHRxYXgxTXRrQTJpcnJxVXlFbFZ2eFRhVk5mem51QUJMS1JI?=
 =?utf-8?B?bmV2WHA4dThGRVcxZllEZURyTit1Uk5CeEhWRk5FRnYzVUNGM2h6dEFjK2VZ?=
 =?utf-8?B?OGhqdllNUVV5cTJxVUxCUTZubHFBR1RqL0xac3ZlbWQyZDRUSmJ6TDFrSXk0?=
 =?utf-8?B?VG8rQjgwNzcxUCtqTi9xMTNGdXFid3VFOWtwQVpLWURmaVhkZXZZTUFROGFX?=
 =?utf-8?B?bWFNTjk1OGc4Tkdsc05mR3IwY1J6UHN1MkRaWGhLcXZyZWROdjZwTFN2YUdj?=
 =?utf-8?B?Uytua1p3NUczRlpjUkkrZkdwQTEyaUNrUmlSWERmSjgzTm9waGRBLytuVTRl?=
 =?utf-8?B?SG9Nd0U1anRzSk4rM3dnay9DOXB6Z2lXcEFYZkdrayt5Zkd4emhmWUk1NG1Q?=
 =?utf-8?B?TGo2TzlhUlkyK25BL3BCYWg1TERjek8zQmNmWEEyT2N6M1ZtaXFCblFaMmZL?=
 =?utf-8?B?VDRpN3pMUkJXRWdZNlZ3S2hwMSt4bTNjTFgxWVpDNVN0czkrU3hpLzQvenhE?=
 =?utf-8?B?L0xTQU5DY0pna1ZDQ3pvN1dGWGs3alIvcVVJK3crQWtXelZoV0lmeitocEtK?=
 =?utf-8?B?ODd4UlBaT0NObG1WcnFxbHhaQ0N6bGRWZDA4VFZnYTdsbFh5QTQ4VEx6Zlo5?=
 =?utf-8?B?dmExZ0krQUdvTytBUEE1S1dIdlQyKzhsaHAxakk2MitPWUtUanloQnpkREhv?=
 =?utf-8?B?SWVFOGNvRk1pc29Dd3cvNWJYYkNtUFN0WkVtb3RaVUd1VE5wWm9GUStsLy9H?=
 =?utf-8?B?RkJOb1lHUHVjUXMxSWIwdzV6RlFsdWc4eXV3QlZXRHg2Smh6OE1BRHN1WFpY?=
 =?utf-8?B?amhlTXdBYStwbUlQVlhXeGFkeHNzeDMvejlINHZsTnB3NlI4ZStaTVBJYTFK?=
 =?utf-8?B?NGxjWVo5NTZ1L2haemNsL3NMMFY4Y2lNaEw2cCtEdzRaZ3Z6SmMranFWRVBu?=
 =?utf-8?B?V1p1VWNOOVFlWGRweEVaMit4VmdFU3ZxSFk3UVdpaTN2Ym9WeDNkbjR6N3Er?=
 =?utf-8?B?cTNyUDFkSFhFMk0yZ1hDWFY0TFNoZUNxYkdnRVZFUFpDV2tIZ1ZLRTBVektO?=
 =?utf-8?B?TEJ6NkptSERLVXVVQ2M2NjJUd3loM1RMVzMxc1BIM254YU5IaDF1L2xCRnhu?=
 =?utf-8?B?VUUrdVpaNFBaNzU5ckdaNHFQNWwzZ05MenZTZXlFS0hTNjZlQUNLYVpVTXg0?=
 =?utf-8?B?aTRCSlVWYmY4bVFra01ieURaaG1GMlJDcEp6NUFudzY2OW8vUlRBQm9lc2JC?=
 =?utf-8?B?VlY4VllGVzNZRklHQ1VVODFWMnpjMkplOFNRSExFY21ITXdWV0drMlNrMGtI?=
 =?utf-8?B?ZEVrTGhtOERINElMOEpmODFHeUpva2cvYkw3b05UZ1pYTEFsL3BCS285UDNq?=
 =?utf-8?B?SS9oY0gxZWxJNHZabHBibURhbE5yMFR5ZURBS09LUVA1QVpudzY2MXNrMzQw?=
 =?utf-8?B?YVpudmhTcUdsRFRnWThvOUV1QlZaN0R4KzNtaGhrUGNHZWorL2lkeW1wNkVu?=
 =?utf-8?B?NW9MdklBRkp6VFRGbUhsRUpaL2xsLzR5aVd2WEI4bWE5SmpoT3JOUWVuZjR2?=
 =?utf-8?B?dk9yKzRONFNaTml5VGdTSzkrK3huVGcxb0VBeThoM1JqMTdpM3lDU0tZYlo3?=
 =?utf-8?B?Yy94VDNFcFdDczJJQmFyZndaZmtjRU1YRTg0R3Y2VTM1eXZDV3UvTWxXNGtk?=
 =?utf-8?B?UloxbjgzT0R3eVNVYUV1V3FsQitMdS91UVpacFRoUjdRU3pLQ0dzbEE1MC94?=
 =?utf-8?B?WXZEZkNKZXZCMUhtNGEwbG9MYkY3TXNibHNGK1NWU1RGSzNWT0pDRHBBby9p?=
 =?utf-8?B?WmlaSU8ySHYzRnR2aFAxcWtRcW0zQ0VlT1FtNXA2THJ3NFJmZ1gzRlRrbjZH?=
 =?utf-8?B?VFV2aThCRStBZTR6MC9iM1NMR3pIcENZZEE4UDRNWnRZMTYySkN0UTZwb28r?=
 =?utf-8?B?STFSdGZiZUVpOFQzOTdIb1pQRWIvOWh2LzgyWjBscWxlakdnSThFWXJPTzhH?=
 =?utf-8?Q?p4yghsNM27espAWsA7N9lWdeL+1fzwwLRpBiKe1A1rZZm?=
X-MS-Exchange-AntiSpam-MessageData-1: w/CqR6tmDwKtZA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93004267-73b9-43b9-4172-08de80a5d86e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:11:32.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82cYSBk4QTkXLc/PjnwDxEkBPxhYx4FbMGnNlG+Ht7X0f+/RkLpRytIBtHGMV3QPWWnQ3MCn5Q4ofVAEYd31Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715

On Wed Mar 11, 2026 at 6:59 AM JST, Timur Tabi wrote:
> Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
> DMA coherent allocations to be exposed as readable binary files.
> The implementation handles offset tracking and bounds checking, copying
> data from the coherent allocation to userspace via write_dma().
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/dma.rs | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 909d56fd5118..b1cc39756dd8 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -5,12 +5,14 @@
>  //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-=
mapping.h)
> =20
>  use crate::{
> -    bindings, build_assert, device,
> +    bindings, build_assert, debugfs, device,
>      device::{Bound, Core},
>      error::{to_result, Result},
> +    fs::file,
>      prelude::*,
>      sync::aref::ARef,
>      transmute::{AsBytes, FromBytes},
> +    uaccess::UserSliceWriter,
>  };
>  use core::ptr::NonNull;
> =20
> @@ -668,6 +670,38 @@ fn drop(&mut self) {
>  // can be sent to another thread.
>  unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T=
> {}
> =20
> +// SAFETY: Sharing `&CoherentAllocation` across threads is safe if `T` i=
s `Sync`, because all
> +// methods that access the buffer contents (`field_read`, `field_write`,=
 `as_slice`,
> +// `as_slice_mut`) are `unsafe`, and callers are responsible for ensurin=
g no data races occur.
> +// The safe methods only return metadata or raw pointers whose use requi=
res `unsafe`.
> +unsafe impl<T: AsBytes + FromBytes + Sync> Sync for CoherentAllocation<T=
> {}
> +
> +impl debugfs::BinaryWriter for CoherentAllocation<u8> {
> +    fn write_to_slice(
> +        &self,
> +        writer: &mut UserSliceWriter,
> +        offset: &mut file::Offset,
> +    ) -> Result<usize> {
> +        if offset.is_negative() {
> +            return Err(EINVAL);
> +        }

Won't the `try_into` right below also reject negative values?

> +
> +        let offset_val: usize =3D (*offset).try_into().map_err(|_| EINVA=
L)?;
> +        let len =3D self.count();
> +
> +        if offset_val >=3D len {
> +            return Ok(0);
> +        }
> +
> +        let count =3D (len - offset_val).min(writer.len());

We can simplify a bit:

  let count =3D self.count().saturating_sub(offset_val).min(writer.len());

That way you can get rid of the `offset_val >=3D len`` test and the rest
of the code will work with `len =3D=3D 0`, which will have the desired
effect.

Regardless,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
