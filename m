Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFD73009F2
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261620; cv=fail; b=QrgyxhsaRyhOb/KgbCDEtAFdv14R7iJp/e6NwcFpdVRdbIsWZgxO8DX2L4Ceo+z8BJOiEb8prxsc78PeWBXSv1pX3mnRr6sLMvdDY95eGGstCp+pU8uWsZyql5HVrWS+7XwDOfrsMnNJ9bq+jR7pFsap0esltmVZ5l+sOM/bhW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261620; c=relaxed/simple;
	bh=g16Gv9IpKT19alabzGn9sdp6XQ/+rPkrXtpcmTYiSl0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=BP4Pq/faS/sCB3KfKyYxOepT+2alI6q776H+2iu6BJWlRNs4TKF5e/WTuLjz4HRYIKRpKS3peC/lGpSyeAafjBwEB48GpND2s/Bw5WhyLkdmEQPf2eb7qhMiVDaOmrikbXu88wh5azqpqe1piYFwZYhU3M3g1TjlSNqcjDqZQig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bVdSNp9V; arc=fail smtp.client-ip=52.101.62.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bVdSNp9V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyUaGAZRuSqvWmNKdEKA33xRflPweOcvh3qxQyquoIETydakfmgnN7M6pRnFGiVpm+klTI6VSKqhqm/jcYoe7wu1ulbr3hJ7EyoQKXcrzaJcjdanapck4cvcrtWmpw4h+Lty25cWep/izy0r8c9rVlOK3J1Ns5T64PnLSC66E1VxfsUlalEEucW6l35F66nt4u50dQDQs+G1bq0Qsy4xVxkOUErXDZsiAASneKnVbjjgfCTnv5bHb2V+Lqts3Ou0u6/gUskT/clx6o+LlqFdnq3U/yawnGoVgDwW3U8sjGtPVoRULJMS7OmOyupp08yo98+XpuhiE1TyHC3cW+Pk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGTARNzAGPWUUqex99Z2upg+9ZFw+QdD7q+975FH6lI=;
 b=pdmCR2RSfSWHthRcp9Hv9laZsO8pP9fX3dJ+ExB43F+MB8N4+ppZkX5ykmu+rquSUPoXmctiLNWNmyH1QmqyDr20m4bA/tse/qqE2NIn/svT2xibQ6fSCHJoN7Ee3MzBHl/mTh9myZVDzRNTBXC6Sm3/ZIlGBHV2PV53Sfi3KqEe6q8h/NPy0z2nwg75Kl/gjvb/naXsex5QsRgFHhpxcKdbtv7UXNscH9VflgrUVa/QBeq1CzwX4ug6+0qmcKirIxw5r4NtAhzJ8ICowSYwbIW42DoJRUOGAFoBoVnrUq20G+ImagW8/p6rFSVu/1jcsSkaOjYw9DNuqBreOzClhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGTARNzAGPWUUqex99Z2upg+9ZFw+QdD7q+975FH6lI=;
 b=bVdSNp9V/AZIXc5/RmTE5UXhilu4TnfcTKNkFASuYyl7IWV7ZdYVaufByMZ9W4AFuxaKHHQ+OnjWF9YqL1u9rOID3q9Z2fjGau8ShpcAQBW45pgVjOHwwrpOfJ02b2EHu9N+hES2CX+gV8BA4cHodFgFe0CewvimvGE5grdI+/kNXHAaWq5e99Ab6mZokvnsCLXBsw7Duao6kguyP44RqS6VJMuj6da93ZmpJwvhwM9GsryPBoda46DzAGTcYeeBwz4SqomVgmghRb2C76ZfuuS/WXb42VpW8jfvikyRWiQl1XCnVEIoUl7F+Z30yutnLP5aBuVnFTH1mZLDprB2fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 14:00:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 14:00:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 23:00:07 +0900
Message-Id: <DHTS6TE0L98G.1RV4MU8R0NSBQ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-6-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-6-ttabi@nvidia.com>
X-ClientProxiedBy: TY1PR01CA0186.jpnprd01.prod.outlook.com (2603:1096:403::16)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: dc88ee71-c453-4467-2dec-08de9af74f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MdxH1ZIOPhxjtfaIZsdK29b3EateayrLLA1cp4vmYrcRx7pdNqdlgK1Gj2/bGMARiyhne4TBC9b+wV8PRQNrD2e0MnJQvMcxVkNPX1R/o1kwEsIrM1nFUvLHqcltFx4sAnTzHnG1Cac0PwDWkVn6j4hURs9J76R3TjAL8Uv+whV9qywkJdNN7kWoMGtTiJtsm7Nu+bobVGU5myqxlWIthSKyTBG/QUl6MP3Po2+ThQOhU2vEs6jLiuBzunvGITYj5SJJg929wZwYoIpcyqjz9WwS0Rc80z/cH6YHejOMPMsoqQIaRi+7HGyzjniY+Eb+EhJGZfzXd/ZPAdy2lo7eGHZs4aIy1sstARF48UiYIfwTTpzrTG52+TabtQ6lzGONRJ+Kfn0Nj216G0/xcZQEmA360DZwf0C2PYCSo96hmmX0wkAAWkKxE3mj6Gh2u6B14xRPvtgLGW6kZriZugeWS1uP5ptJXHKEZbFhrowPfEQtOblfwc1lH6caeKIEiS9ow9ZXfGiUOZ/of9YKC37tL1/ebf03h11j+cd5F8Wpl0dMqUyUBf7AcqMd+aIH+OUdKCq/ks8u/0gRVs1JE+ImIsIsJwk5D3pWWxu4QJy9fWhpZitHZUMfjUEp3rXN60n2xNepgFKMZHpU0eJQl5EEUJoRL9sgNmLmfgsk/tHzoyBPsXM3Fo+ssfhuM51MWP/GlDk7rfwNFqj9yOX+6+cqiExGDXWA5Hkvt0UXa59TU2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmdkRlAzOGhSZWtEeG94QWdmT0ExeG5HeE1kR3M0SlROcWU1eVZTeHBuR0Mv?=
 =?utf-8?B?bGFCdXZORG5oeVlreFJFaEhYSUJOckVVUnlVQlVLSGVEaE1xOWV4TVdOOG5Z?=
 =?utf-8?B?YWdFSFV5Y3phOTNsR2psUjBKaExUYjhEU1FiczM4TDRwS1JtcFpuOWJPRVMy?=
 =?utf-8?B?VWFHcTE4N01rSStOK1FOTEdjMjJEMG53dmJ1MUpnMWVLTHZYcU8wMmdSMnBV?=
 =?utf-8?B?RzNIemJIVUJuTlNnYTFHUi9WcVNGdjVjNkNRZjVEUGFhTUZyNkcyNUJMcmRu?=
 =?utf-8?B?VTJGSnNlYThySXhTNkl0WHVOVFFpUHhtMGxjOVgyN3hTeFFqYmZ5UjM4ZE84?=
 =?utf-8?B?MkZ2T0F3cm1kdEFyelZFaFhiYWs4YUpxSnBncXZndUJXaHJDSGozVWdjQWg2?=
 =?utf-8?B?ODRIa29iNjRSTU9sNlpENTNCeTd6U3NoMVZDeFBwS3VtaklIMDNvQy9PRGQ3?=
 =?utf-8?B?aFlpbTFET3NqdllCcWhYOXc0cjRONjdGdzZ5MjFSMFVGTzAvSUtjSnJBd1h6?=
 =?utf-8?B?SWlxUjlGbGhPczlEWmw0QS9oTHdnVnhqOXdGMUFSU00xMmNJem1EWndtZ28v?=
 =?utf-8?B?MGhrNDN4eW1JVEVVRWJsZlNieTg0d0Q3Q1NhUmx4Lzh2bTBBS2dUQ0tUendp?=
 =?utf-8?B?WDQvZ0ZUTlZicldzNjhUN2MrTVpIQUgvaGJEVVpwWTlHQmhxZWZEdU9odUoy?=
 =?utf-8?B?eUxUZC9OVENCUWlVTkY3RGJhZDNiWGQ4VEloSWMwNWhxOXFLZDZZbE53R2xk?=
 =?utf-8?B?WDdwbm52ZmppRU50RWRhbG1YUGoxb3N5UjdseFpjNHdEbW5mRUFTSlZyWE93?=
 =?utf-8?B?TVhPRTZsajY4cWkvZytPcXcvN0hUZjBaVnNrWWtpcE13TGxmNk9zb1VVOXVn?=
 =?utf-8?B?aitpYTRnc2VSL3Y3dSthdkcvclVBUFM5cDNSSnYxRGlzU3FjQmh5RllhTFdm?=
 =?utf-8?B?Kzk5N1BZRW5Mc2VXM0tFY1NWZzBMR0FTMmZHUTR6S0x1NXJFRXNDdjF3RURC?=
 =?utf-8?B?a0xrbXVMVkpla0Q4UVBIMkRBbGU3cExXMWh5anBiRXg4alh5OGg0a0VBS1VM?=
 =?utf-8?B?Nkd2WkVUOTRha3NROHl1dzBLcUhpS1lWNEtoUXVhTU1pRnBXVEtEeWRsK041?=
 =?utf-8?B?ZHZSUTNnR29wQ0Z0cXd3SFNWczdJeHViWEc0c1B0RlRkWTJkZSsyc1Y4Z0Fm?=
 =?utf-8?B?WlFERzNQMk9RSFVZaHF4K1JDZWovWXJSa001Nms5bzNTcGhIRWc4Z1BueTEx?=
 =?utf-8?B?NU1vTW1adHk1THl0SkRORWhjdlhEZ1VVd2hrSGFjTm9UbGVXS0lFV2V0QzVy?=
 =?utf-8?B?RVZlWTRkQ0RCVG5ncU9GcUlYenNkMXo0R3lnRXBTVFZmQTRqNE14NjhkdXp2?=
 =?utf-8?B?TnEwYWlUOUhUQ0QzS1NNRUF6d21ZN1l2K0ZxMTh6RmN0Q0I3VnpXVW1JSFh0?=
 =?utf-8?B?REk3eUtoNFl4TGg3S3NkZFBrM0puaTdHaVZPZ2VSQ0UrQzRCeCtVa25BZzM5?=
 =?utf-8?B?bDFqZ1dqZU9aMlZOVTFDbmk3T2laS0hldjVZT1Z5TC85aGJKM1NBZVY4SWtp?=
 =?utf-8?B?ejlXTmRCUlFwZnVjVllCU2xIRjZQWFcvbndRWGZhVFgvUUVoaUx3TmFrdGox?=
 =?utf-8?B?eEZPQVZLN0dlZFhhZm9Td1BzUWRwNFJHYkc5VzRCYTRRSmFhcEFyWlVoYjZU?=
 =?utf-8?B?bnlmVVVLYXJVMUJXM2FyQVg2OWN1MEFSZHhsTXVuaktha09SU2sxL1B0OHNP?=
 =?utf-8?B?QmhDbGQ1NDBtZGE5SmhrWGxGV3VGSlBaV2tqQzJtUGE3dkVUTG5QNThidlZQ?=
 =?utf-8?B?VXR5VlV0MFQ1RzcrZXpsSHhleHB4a2w0YStCdmRTOXZmaGFwVFFxSGIrMS9Z?=
 =?utf-8?B?R0h5ekRZZ1YyRHlVTnBkR3RoUXNJMng1b0tFWHl6dldVY05sNC9RN21HTmpt?=
 =?utf-8?B?cW5zSnByZmE2eElzZmE0c3liUFJDNTM4Z1krdGdQSGViNmFGVitoV2VyRFBS?=
 =?utf-8?B?bWw3Qzdkc1Y1Qi9FK29pQUZMMngrYUJCQld4UUdQNGlXWVVGaVJUNEh5L3R6?=
 =?utf-8?B?THJmaEhDa0c4SWE3RDhaVGNUN3RFR2JOK0phMXF1UWF0ZmV2ZTJLUEp6cjZN?=
 =?utf-8?B?MEFnZm84UjBUVHBQZ2xlTUUveUxFc1BudG5nd1ltUmNSTkJYei9mWGJMOEo1?=
 =?utf-8?B?Tkh6VDNSZkFqT1llU0RrK2htYS9ia0NWRFduaDFvdU5nQ3RWOUVjdWtkczBW?=
 =?utf-8?B?OWovRkdnbzkzNDNiZW90WkZNdDB5bG1TTmMxQ2RTL0xPMWdrRkpRLzVTM3Nt?=
 =?utf-8?B?Zm0zbk9INGcvK3NiRU9kTndjQi9HV0tTM1BjTU0zMmE4ZC90TmFjMWpaQjNu?=
 =?utf-8?Q?YNoDaSTZqxu/hB6R9FCarN1escDQKEovjdT4G4eVZ2PRe?=
X-MS-Exchange-AntiSpam-MessageData-1: 7txDIoqvkTMGaQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc88ee71-c453-4467-2dec-08de9af74f46
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:00:11.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goETOXxQfM9PBMaq0IDb/0smL7sRJmuawP7K5gfb5v0RwnMwL3gbV7W9DypYLi+PWaO40XOQQ3d2Rj1aQxK7qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758

On Wed Apr 15, 2026 at 8:50 AM JST, Timur Tabi wrote:
<snip>
>  impl<'a> VbiosIterator<'a> {
>      fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
> +        let signature =3D bar0.try_read32(ROM_OFFSET + NV_PBUS_IFR_FMT_F=
IXED0)?;
> +
> +        // The ROM may start with an Init-from-ROM (IFR) header before t=
he PCI
> +        // Expansion ROM images. Most GPUs apply the IFR offset transpar=
ently, but
> +        // GA100 does not, so we must skip the header manually if presen=
t.
> +
> +        let current_offset =3D if signature =3D=3D NV_PBUS_IFR_FMT_FIXED=
0_SIGNATURE_VALUE {
> +            let fixed1 =3D IfrFixed1(bar0.try_read32(ROM_OFFSET + NV_PBU=
S_IFR_FMT_FIXED1)?);
> +
> +            match fixed1.version() {
> +                // Note: We do not actually expect to see v1 or v2 on th=
ese GPUs
> +                1 | 2 =3D> {
> +                    let fixed_data_size =3D fixed1.fixed_data_size() as =
usize;

Forgot this in my previous review: please use `u32_as_usize` and the
other relevant functions of nova-core's `num` module to avoid the `as`
keyword as much as possible.
