Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534343A4522;
	Mon, 30 Mar 2026 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880966; cv=fail; b=cAhT2O06Jhh/Qg0aPSWHF6x2FQ7FDdhp1nWNzjVSsY75rIOWXO0MrPE4X2mYTa/SrRsyKP49nYeS7bQNk3iRYA8d+z2Y/SQO4WXpaTCJCyIps3kOJtsF94bidzjJTym9qJjqR71gcb7Zppuox17kWQYDfVCq8H185SaSEVVxe40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880966; c=relaxed/simple;
	bh=ZXsAOxJGZ8xsZkD+D1OIbQHrJ1Lz3N8SmkmqHy/72Ak=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oUaSPEhJGKZYdf7q2eeCJVYgNNGVirByoO9q+RlK9VOpA2EM+QTlUGsTlSuA6iNDufvFLczfVVWnZ8RKTiZucHmzW3Ptd5UwnLu3ftPhvCeBaeqHj+xRkqg3usZkHLsKd6kK4A4CzWHmrbYJumckIxFLNY51VD/pWwGS7uBri9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Eq8xIfhK; arc=fail smtp.client-ip=52.101.193.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Eq8xIfhK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3H14jU7z4a0p5YRXwz9YbZFSAQ3bw9DQlEWwSkPkxyst3T6enTAiD5bWLPbX7qKsAUCO2/OWvZaT2TH9sb+nqUTVOmr755V5la/iRDi8+3xGGly5S9bpBZNDa4O6LqZfqZGfTHQ2n6e4sS1EhbvJJjIVaoCWTa4jLhCy1plJgT+NF63po/zY1zGCSDPvUaFRnw8JlqVtK22eKalzqyRAYhy072SzDOWatB90TBWZEAwSx+xBhCwuFWpPKaDgGjNiqG7Am7YosOwHfATof2i/uYDVmcNjok413WK/gmrG2n2Sg7L9qR+6AIkMkmVx3sTFEZKbFIG0P8LVCWVs5l0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKlhI9rMQxLf7mgvCNU0egiW1xbJ2Xt4RrobJ1HkCGk=;
 b=KlVIz8LWLtSpeLJogNd5GZtc77cx7dHkL3UMZeAx2O5m6NjKXIuoLNkKeK8sxA1v5CQWV6vxH2RyoCqon+oMHWbGDP+Eg5aFfG9iN/4+5//lbnR37pZNz/xDzTyDlopQdLeUM04DXJERVvKO20ZXGDgfT5EroYP45m/FnvedzGAmxITEZGU6rp370/RoLQVkuLwwkwJcgUWbnD41EtxFpV57Za+6WUtaoJuwk52TmUL8c6RrVUiLdE5bOSCuoHNYQZFvn9NWGVCX8jGke3Sa+6gCXNPyABYaSSdltuJww7/aRIyyE609Iij4XCiMKafg+XGMocfwpO/wfuLjRNzXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKlhI9rMQxLf7mgvCNU0egiW1xbJ2Xt4RrobJ1HkCGk=;
 b=Eq8xIfhKn6Xq+MOhEXWNixVgUhlaw1qiBFHArOcBv1aTUImAsh61MgGWsT4QjggpvrrzldZP5oVNilgNcsMFlTjrPPCZtKVNlHKxCh0oKV23TzQo5uAqkGArhLhUuRqvQ2Kixv7wjQLozDSlwiRAPe+1KYZCGgYdJzDZZxCfCrxHyeUzyVlcR1RlRxsGmnnZi8V9whKoB/9pAvGSU4j3KSmIy/nW4dRIklh2xT8pDSzaW3riEa/Td0iQMgWOSB7okJRxvvXjbtckF5pFCVE9MXbJc3K6CmDVYZWlLsYdW0Gj7T81s6YlIHfMm7jrUc8YvNkkObnjZIKrFgHNu6EhpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 14:29:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 14:29:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 23:29:13 +0900
Message-Id: <DHG6SDIQKPJK.2866FUFZXM14Y@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 02/31] gpu: nova-core: factor .fwsignature* selection
 into a new find_gsp_sigs_section()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-3-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0057.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 210dae2b-d7c2-4726-9009-08de8e68b89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GIBNJO5/N2+FQ6OW6PEfx2OP4RxUNdfZh2E6HTweCMigMn+jJPHzrgsem9NUTgdVKgNtv0ixIVnKsGxN1uNuZB0uh/v6jbCtnLahf2majs6gvu7U/barRLv5JAGGegGnGWCGMuy0rz3RtnB7DcMjXIVujapfKM3SGZPK/6WT00HRh8RGEg0F+OHn7CCGn01ZBpXNys98WLx7g2MDRSHQvufw1LToBD5FzR2eGO6Pry398KEsnRXOeTz1G24Apc+SImKF5sUREB2/EAigoWQ/66xgIMGAMshWQExyctcbG0Kjvu3g0942JFLq48qh27olZDUorCvWHLn3z6jwN4Rm9EZsfqenaios+/Gf6VYW1x3jPAm1AcqsoDT9vRC2OI8bIRvCuUg8aIsHLeMjY10MzGDwCabEsIcY5Pwxku/2aP7qF66LNj9ishQ05STTZFoI/E4rFLOjGSksAmF1ad96so99uz6jTtss5kvGAnIBJ6Y4ITEeXwREr79CVR0scncy0P+7bBFROSoBa9LFuumMXt4Dz5Vzrfi4L9O12vbhbfu4nauG8+B8pL1UriH55vjaQ0vXzwc1rYPbw2Qsqsm20/ZtWlSkr6VWtoKQ98tzcsIDj8cvngHwi9Fv3nsj1wiS/gP8GRMP/Rt6dXMis07U1sjXYbC7s2m88fkzf8hmjvMPV4uZS7EDh8APO3t9TRc72f6julnNYuqg4lFfCANZKMQzNK6O3vm03GQ3rHohEK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFR5R2dKbDY3MURFTTdBVEc2RVkwdll2MWVTMnhjUDVBbjFocStCbjF1eEVJ?=
 =?utf-8?B?S1NhVDQrbmhkOFhVcnAvbWs4Z3ZUSUhBSHhKL3BEUDh6V3BvRVBHNHkrQklt?=
 =?utf-8?B?SU1LU3ZTY2wxMU4xYjB5QzBMYnFRNGgzY0Y4SlVqM0JNeG9nWkdDK1lkMlF2?=
 =?utf-8?B?RWhEOTJIbElUQjYvcHNUYjgzdWhMVGxPaExwQXQ3TFJlNmtSb2tlN3FQSFFJ?=
 =?utf-8?B?ajF3UmpWUldFRDVhOXRIS09CODlIS2U2YXd2RkljaFZrVVFucVg5bW1JQ3pt?=
 =?utf-8?B?bG90LzNvK212cUtFYmJsNGNLR3B5bWhDdkJmdytERXJ1N3FJc3Z5QTFaamcv?=
 =?utf-8?B?UWFGbWx5U2hSRUVYVUI5NjRQYlhkRVMxQnlkUCtqTUZwTEorVmRreDEzUEEv?=
 =?utf-8?B?N0NEQ2xsYU5qSmVTam5RUFBLZUJsN2Vra0U5YksrUUg3a2tLTFlQczBEb3Fk?=
 =?utf-8?B?ZXNrQ3VnOCt4WWdLanZtQWNWOTVCdm12cHJ0cG5qeGFFSkk4aWVKY1UvNGpG?=
 =?utf-8?B?d1lkVW9yTUFlWi85YS9BSkdSUTE2d2VqYmFzRGNlQURQU1lsQytLSVA1WElR?=
 =?utf-8?B?aE0vaHV5bDZXMk10RHVnWjByR3JrcS9uMGF6SUN4ZEt4MlZrOVpoMkNWM3Uv?=
 =?utf-8?B?NVgzWDROUGpUV0NkeVQ3QXpnTCtFS0kzSTZFc2FpWmJaRU5rNHBLek9NSEJx?=
 =?utf-8?B?U1c2NWYzdHQ2VkhPV0ZNUWpPMDFLUkVjQW44VkI2TGNQZmlmU0lUOWVYVnlO?=
 =?utf-8?B?TlpkOC92UUl2dHlVdmVFdW11TkNJTVpwMVZaZzY2Z0Z1TUZ2ZFBrYTJQYk1y?=
 =?utf-8?B?UWFFUEZZTkdPRExYclQ4cE1hM2RBWjV3dFVTUTYwNEM5ZThzZklQZTFCaE82?=
 =?utf-8?B?VSsrcGVuaWZLbDZaWFRQdUFJQTZ0elByV3V6R2RLSDZEWENXRm9BOVM1Z2wy?=
 =?utf-8?B?NlNGbTRmMHZaMk91bWk4MUlLancxKy90Rjk2RXVQNEIvR1Q1M3J5SjY3eGFa?=
 =?utf-8?B?czRHWWtoTkwvVVNSK1RHZ0pYdUFvRTdqYVNjQlVOWDJHODJTQ0pSeEdjNDlv?=
 =?utf-8?B?SkdVL0hXVXlhVTNsN1J5Z1cwa2gwWTlXVUhLRmZFNkxvWWpDdkY2TEJPZG1t?=
 =?utf-8?B?eHpoWWVhQ1hoY2VqYk5xcFVLanUyNzE4RFdYNmFuQWZrSUk0c2VqOFRFK21h?=
 =?utf-8?B?TzgxUG9XTW1IUVJFNkNTWG9HU2o1elpqRDFhRzdxekc3cDJISjF1VEJxVXJi?=
 =?utf-8?B?VjdmNEN0QkJqZ3cvMnBzYmM5MjNWckxpckxicXlCRWtBR0JMSGl5VUpudXJj?=
 =?utf-8?B?WTFzS1dvQTZwK2NBK2s5TkRLb0dsNlVzd1R6ZS9mamk4RkxZL3BYNWhHb3Jq?=
 =?utf-8?B?eTVPaEY4dmQvVlpQT2NYSWE3QXdMdHd3VVJ5M3A5c0Y2eFBmdFBHSWhYWk0r?=
 =?utf-8?B?SGV2bWVwZ2FJa0VHS2VrZ2cwYUlXR2JiQ29GaHFzUGRuWHBrcmlTR2VGOHJJ?=
 =?utf-8?B?TzM2eHc2VXhjRjl5dlpKZWV1NHQzNGVhT0lBWS92WUtjUGNpcGlVc0FBeDBh?=
 =?utf-8?B?eVZsc2RYU3dGMENYcDVzYjFHQks2dHdJZnVuS1VRcUppcDU3Z0dDUWFYcDdy?=
 =?utf-8?B?ay95N3o5Tk9jWmpxWk04OG9IY0xoRzZmQTJ0S2xoRTlmQWVRVDlWM2Y3OGt6?=
 =?utf-8?B?ajhnZVBTVmR3VG1VVGxubnpBdTlpUm10TzUzQmZhK2Y2VmRCYUV6b3EweE13?=
 =?utf-8?B?WFZnVCt2VGhzVmtFVDR0Q25FZ3dKR2h1V3pxMFU3eE4yN2syL0ZEWmpvYzFP?=
 =?utf-8?B?a2Z2NVI3U3JCa1hPSURpYW1mZTUxRlJmNTlzZHBOQzdlVTJIQXprTjl5UzY5?=
 =?utf-8?B?bkVWamVKditGRUhOSk13alVuWktOejhMUElrNFh5L0V2WGxnaC80cEprZFFC?=
 =?utf-8?B?L2txQU1mS2NQaklxcHp4K1YwQmpGdjVxMEc4bGZ5YWIxTVNWL3A5b0E4bDFK?=
 =?utf-8?B?YkpHdEpiajhzVEhNMXhHcXBCS0dhWUxpMUtIcjhUV2lpdmhrMjh6WXNBQXRr?=
 =?utf-8?B?OGtNd09JZ3J5WUZiblM0RTY3dlV1QkhLTisrbHp0dVBHbDhNdTYzQ0FUQmZs?=
 =?utf-8?B?dk9saXYyaGdGazNIVGt0ZjI2NFpNbGpxSG1XakZmOHZFc1U1eStKU3Q4VzBP?=
 =?utf-8?B?NGtyL0thN24rV1ZNY1QwWEl3QjBLU3NFaXZ3MmRUSmxFdEl4WFVNbkhuMUNZ?=
 =?utf-8?B?L1VIQndCb2R0YmZhQXFESEd4VEdGTE9TWnJFSEdERVZFWVhTMllEWE5zMHpi?=
 =?utf-8?B?eC9XQ3p6UmZtRElyQ2pjMzltU0xVc21kaVhPUFRoRm9zY296MUZNTWtmNVZ0?=
 =?utf-8?Q?rcy2nUNTfg/YNBKdLu/AXPDrBxiyzmlkBXKBtgj6T9hfr?=
X-MS-Exchange-AntiSpam-MessageData-1: 8l7qcmLbCcy8lA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210dae2b-d7c2-4726-9009-08de8e68b89d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:29:16.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQW9wj8Kq/u43skwvxbidn/+Nbkr6iSRuOzsVNt/qJ0MrWO8nNJKi/MhmQaC0OOq34f9F9aPZO2X3oKCK9owYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Keep Gsp::new() from getting too cluttered, by factoring out the
> selection of .fwsignature* items. This will continue to grow as we add
> GPUs.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 31 +++++++++++++++------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 2bbea1db0238..60ea730d1bd5 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -146,6 +146,22 @@ pub(crate) struct GspFirmware {
>  }
> =20
>  impl GspFirmware {
> +    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
> +        match chipset.arch() {
> +            Architecture::Turing if matches!(chipset, Chipset::TU116 | C=
hipset::TU117) =3D> {
> +                Some(".fwsignature_tu11x")
> +            }
> +            Architecture::Turing =3D> Some(".fwsignature_tu10x"),
> +            // GA100 uses the same firmware as Turing
> +            Architecture::Ampere if chipset =3D=3D Chipset::GA100 =3D> S=
ome(".fwsignature_tu10x"),
> +            Architecture::Ampere =3D> Some(".fwsignature_ga10x"),
> +            Architecture::Ada =3D> Some(".fwsignature_ad10x"),
> +            Architecture::Hopper =3D> Some(".fwsignature_gh10x"),
> +            Architecture::BlackwellGB10x =3D> Some(".fwsignature_gb10x")=
,
> +            Architecture::BlackwellGB20x =3D> Some(".fwsignature_gb20x")=
,
> +        }
> +    }
> +

So in v8 I pointed out, on this very patch, that this method doesn't
need to return an `Option` [1]. Which you agreed to [2]. And yet this is
unchanged?

Oh, actually this is fixed in the next patch, for whatever reason. Why?
The original match statement was even exhaustive to begin with, so I
don't see why that `Option` was even introduced in the first place.

Please apply the feedback on the patch it was given on.

[1] https://lore.kernel.org/all/177443554510.105362.9416236198599659187.b4-=
review@b4/
[2] https://lore.kernel.org/all/5db75d43-830d-460e-b377-9a1f72c21fc7@nvidia=
.com/

