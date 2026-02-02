Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020074.outbound.protection.outlook.com [52.101.196.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A1372B2F;
	Mon,  2 Feb 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043799; cv=fail; b=oS6yEN9BvZbsdLDwxl87+dpS9X+cydWScxZh26Z8Tg1CRojiIudLnqKzc9OV1YjnME/387oCaR0Cr+MtHxdE4jdOVVEP5Cs3QzymtBva86YoCvgje7ucGpdBdoa5fGi9oT/odFAtWYFS2dmR2K5ZOR99k65F4KzqZHkDJKBm6ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043799; c=relaxed/simple;
	bh=o+n2qVJ9NIXKTBQ1QowzItc3xTn2nU+7OUNvshQjy6M=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=LotN55XNCWGugXpMpuAoAUH7Ro1mMlEiDjLqd+N9YZy0ZMW/FRy0ThaF8aHDgIOXuR/MI9kGMtAAnSHNxTbFIk04H6z7KZTEdpTycohZRI81EiMdLD7lUEq2xPstcYpUcKSrLRAZypse1McZueFmSIM8A+7KA42w5RgucPbJGwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FukJ+RL8; arc=fail smtp.client-ip=52.101.196.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FukJ+RL8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3MRrGWiCIA0/Mk0joEynRKEF/ARM2bQK+/WFMWA/zq1IAZihTKkzep9ryaPaP/whoCHX0snTcHPs7S6xoNpnMvDgCVTo5E53k4Mr/RMf6wG0P0spFRdfxP0okXUgvY9fppBIoe31milErrU1srBmHX2HRqmcj9ZQwPKV68I4eGl8fXG3vWw3iNkfO2JdgnKW/GPFiYgdkAV3tguAJf4NMUssE/4/30kefIeNYiclsrvZGvLyPD7A4isbG00yz+OM0edLecb18Uiw8oafJUwChtOJXQtb+GkTd39rQsTP2KcgX6Xq0/cSxTSoLuEAxZ2gh9ZUhzVlUhY3lkbTOIUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScyguCva+PGQ+LX31HhrQ+4FGumV7DU6RsSsVTLQlWc=;
 b=FGbynmKOkdGLXGh0TaKteZ8lqCvSyjMyVuqAXWfui6/35VMMTgTyMWjtxTOCImpD7nRj3IgZuGwg1tSsU3r8vXsV6yPV0+x5bTxpr11rIdZ1y2HQvOWuE4Zx7uxxyGDFy6JRfWGBalW0UMMPbAsb7Aubve0RItQ63wL9vDTwEv+KL1MhOqrpw3G69c7o9BJzSUEpiTR+RTcB+GZpAiGgaWT1niD/Zqup2AdnwEGJg9We0XEWSj7puND+zDbjgTVKw1k3iDsIgLDYqKxtRaWJeyQAB3+5PS8GZ1i413W9u28lz9r7szpD8R1JWIwC74/dPZSRs0IqlEYk4u8OvsNXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScyguCva+PGQ+LX31HhrQ+4FGumV7DU6RsSsVTLQlWc=;
 b=FukJ+RL8hcUw+CNelaEe/KxoHK61WnoGrZn7p4rCVclV8rZAFe+ojBpB1el6S1YQ5kYHuhfhP5goKI+h4bDXmgnGJ1KikIOcolBqtbupdX6kmqRN28gMhuLF06bjGV5UFRCPVOy88YsDVDoljUvmn7wOKoz2oOFRIOgPTI1HFH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5884.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:49:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:49:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 14:49:53 +0000
Message-Id: <DG4K5PA5DYIF.1BWA30EA8G1LQ@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/30] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260131005604.454172-1-jhubbard@nvidia.com>
 <20260131005604.454172-9-jhubbard@nvidia.com>
In-Reply-To: <20260131005604.454172-9-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0544.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b7660a-d38a-4a8e-e65f-08de626a53be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c29JaStGVFVIaFl4ZHJvWEF0K1pZbVBHWXdaakdLcTFad2kzVTN2bTMzNnJq?=
 =?utf-8?B?V1p6THNEL1ZuOGwzNWJVR3ovV0RhLzlnR1IvQ3c0OHdGNm1GNnkrUXNBWnhG?=
 =?utf-8?B?Szk5alU1TDZyU2ZVcHBEb1BYQkx6NU1LOXRVQzcxYmRXbTE3dTlNVTdtU2c5?=
 =?utf-8?B?TFNpajN5V0gvTVVGSFhONFFBVnN0TGI0SjljQ1BkMDFhSzVCei9qLytQUVdk?=
 =?utf-8?B?UGc5NDltSzZKNkhodENxR05wL25BdFFwRjlSN2MrMktLRzROMFV3U0UrRWx1?=
 =?utf-8?B?cEk1RHIwWithSmlkd0JWcVpRN0V6a0kwcmJ1TlFjRXJVUVl1aFdvZ0Y2U0li?=
 =?utf-8?B?QjlWRDF4aTZVaHViMGFOaG8xcU56T1NZQWZ4ZmNBeC9VZGRtNjVxYmliWW04?=
 =?utf-8?B?MGw0RE5oMUUxRTNLN3BvVjVrSXZMYWdtdll5STFadUpDNXBDSm5kcm5BWkpo?=
 =?utf-8?B?TnRoOWR2ZmtLb1NEVSt1QzYwbFZrUkhmRXZham9OdGpyZWY4MDNGYXV1OGtL?=
 =?utf-8?B?S2JtOVBpZTNXeWJqV0FLU1hwQjlVdkFqazJmT3VCU0p6emk2ZXM5NEhvVThG?=
 =?utf-8?B?NGxKVk1Uc2VZd1hoYmpyM29IeFF0LzN2bkpOMDVFbVpERXRxSWZpUFlOU3Z4?=
 =?utf-8?B?eHpVMUF4OEYzZnZMU2JWQ1kwL1NYMS9PRmt0S0JheEoxOWNMWVR2TFVROWR3?=
 =?utf-8?B?dlNvNWJydkt5bDVnRi9qTjZveEFHTStDZThpKys5VFIwS2s0K2x2Rkl2U3ZR?=
 =?utf-8?B?TDc2N2RqMHhiNGh6OTlzK0x2bnE1cVVBOWtqMU1yRDVvbEJ5RCtnRW05UTdM?=
 =?utf-8?B?d2ljempJdUpGSTlORkt5TmdGV1hDNlFsTjRDYzA3NnlaUjU0VXNGL0R6Yjgv?=
 =?utf-8?B?Q0czSXZiVGFldlBOMjl5b3U2dERuSndSWjBQNlQzTkd2V0IrRTBEWGF4MG1W?=
 =?utf-8?B?YVRvZ1QrWVJpQ2lqYm9ZUkZFTnRYQ1RNWXM4ejBkK05sRThKMXdtOEhJVzll?=
 =?utf-8?B?MTJsNTVRUDh6NnY3ekRiM3N6UHJZcjZScXJYTVpOWUt4ZWVzZXpiS1A5Lzk5?=
 =?utf-8?B?aUQrYmpsVWh2WFBTeEZTQzdsWW1xWWM3RlY3L0tMVFVodGpUa2JDUFFNN2xL?=
 =?utf-8?B?WndPT1oydytsOFhoUndsU2hoMDVVMWNWbkEwQll1TkxTa2RORHpaS0lvaDhX?=
 =?utf-8?B?SVJmNjRBajkyenA3L2ZzQk95S3lTaE90VmVKeUFjQ1daYzNTd1RZeHBmVkp0?=
 =?utf-8?B?NXF3Qlo4ZFE5Z0hUenNxQ2NNWUNxWUlTLyswOXltUzVFM1BnOTUzMXBza3Ax?=
 =?utf-8?B?d01rTCtwbUxlUHVZVXErT2FoQkdLMEZVZ3hQcWZTRVNselNvT0Fnamphd2JN?=
 =?utf-8?B?bHgvNWpITVRvV0lNNy82QnhWVG5aUUJRcURQMjlXcC85RmY5bFVlQ2c5cTA0?=
 =?utf-8?B?Z2ZMbWtZc3pvOFJ5SDNPZm9LVUI2OHZoZ3RrQm5SOVlWRlZMNWw0Nk5WUHA4?=
 =?utf-8?B?V1dVZEd1VFVvM3VaN3hEakFnMkZIblN1ZS9Yajd5TUQ1a29LM0gxMlhOTjY5?=
 =?utf-8?B?NXJnTG8vMC9FV3hRTEd6ckxscXJGbndIZzF5ZFo0TUxvdHJFT2hINUpOeDdT?=
 =?utf-8?B?cTRONnpsaWxCYkx5aFRBUVNjRVRRTDFUZWVDcEFWVVVkMTBIdExDK0I4andJ?=
 =?utf-8?B?WkhaZGtPaVR5RmliT1dZNHBKcjNtOThCUTU5UUl0b29Od0VLZjgxUy94aFRW?=
 =?utf-8?B?YmZIOENXTG1zTHlXbHhLKzNDK09TRUZUVnVtSG1OeHNSc2l5Yzc1SU5GRUR0?=
 =?utf-8?B?UFpNUG1QZys0VGdXZ1d5eUpxK3haU1lZNEczbTBHWUxXMy9hbnhUTEg0U3p1?=
 =?utf-8?B?ZWxFOVliVXBEejV5R1oyK1N6SkVTbEREQzFNTWQ0cVVnVWJmWkN4eVNWRHZm?=
 =?utf-8?B?VDRNb043bGpOdVhOTWZMLzBEcG8rdWwrSW82MldKY3NFSzBHYkZ4K3E3blZt?=
 =?utf-8?B?Q2JsU2l6emxPTmFXbmUzTmdkeW1ZdFlQMVlocG1ocWl1SG91cG9UQjZNeHVN?=
 =?utf-8?B?ZVQwVlA3V1hJd2V3NTN2c2RYai80UlA3OFE1a2kzZVh1eGZsd2ozL256SWxT?=
 =?utf-8?Q?KxgY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2Y3NlM4dzdyZ2MxYm9FWkdqSGJidjlHUzNZR3V3R1ZkREVac1BGVEp3SFVv?=
 =?utf-8?B?OHpSaWs5bmNRaXBrZHpkcFIwanZrUWw4VjZxRE4vdTUyWW5uaFJvdFlsdENi?=
 =?utf-8?B?b2twTVdHM0FaVVFOUUZzZHZKNUtUeTlwNkpRdTJoSnR5MUo5ck1USjR4cFZ6?=
 =?utf-8?B?ZFU4MkxhanNZdUhNbElIdExlZm45Sy80ZkY5S255U1VmeXkzRFBjNXkvSmpu?=
 =?utf-8?B?c00wNjZkQ0lCNmt3MEYwQ0tDak4rOWIyQ29FeWFNdU1YTjQxVlJuVEZwcmxM?=
 =?utf-8?B?TjduM1FBVW1vUXA2RndkZW85T2Y4TWcxUFBLSTlZUFhTaUVYbmFyV3V0czdh?=
 =?utf-8?B?RXM0Yi9pZFhlVGtTVFJCU3BuL2RhVVJpOGt6UkhsUlM3NVhhTHNmVkRmL2J4?=
 =?utf-8?B?VjBaenl5WDFzSjlqNThvMUk3UTlrWWdzc2tHNi93aTFZNmNKMldlWWg2bC9i?=
 =?utf-8?B?aXlBNFcrQXY5dE1kMzdDMW5hZlVpR3hFdnh0TzQwKzZ4cXhFeHh6bzdFZUR0?=
 =?utf-8?B?VVp3R2tXeWZNb2pTUGdiQkpTMWcySG9nVnVVYXFFWU1JZTVkY2V6eitHRUxC?=
 =?utf-8?B?RjZwT3Z2Tmk5VExMenpYNUpZa21zQVJnZTFjejdEbHJUcmR5RzQxcFRvWHBE?=
 =?utf-8?B?ZEhFSnR6Ri9qU0hhcE1vRkNiVEV0YVJCRThxN2ZqYnNJMmNCRHlGV0EreUxj?=
 =?utf-8?B?VXJKMHV1Zng1STVQcVNYUGY3bFRrd3ZWNHVZVUYvdlozanFjRXg1MzlDL3lP?=
 =?utf-8?B?WFc0aDhySXN2VFJRMFRiMTI1TDBrOFhXZllFV0wvNTJwcDFEamFCNmJvZDdL?=
 =?utf-8?B?U1ZpTTBUK0ptRTR1enlsd2N6SjhDMWVvQWR6aW9LaGppWDV0YVJUNWdsUVpQ?=
 =?utf-8?B?dUU4aGduQ2h5ajV1SGlCbmI4SnhJQUNQUFF1SFJZQUkrL3hSRzFmeVY1d0Fn?=
 =?utf-8?B?aW1VZk1FRTdJcmxSUks5eGQ4SUlGTUFxcjBTMVFSaUtCd1N5Ris0L1hPM09O?=
 =?utf-8?B?cjJrdGY4WU9YaHlUMktvMFFFb0xmQXk1MVFyT2JlbU9xNGlpTmtnb3BxOENh?=
 =?utf-8?B?Tmd1MnA2STFSVlNHWkdiYUZYampxaWJOM2krL0pTc1JBdlF4SlBQYmpTUExU?=
 =?utf-8?B?Vmhadzh1NEJnTFY0cWowa1ptUlNRdXNlT3FNeGdxYXJFYnNVY0dwOFludkQv?=
 =?utf-8?B?RStiVkdnQjJaNmM4Sk9EM3FRbnVCV2ZwTm51KzFNN1JjS0RmLzY3OHhFeVNs?=
 =?utf-8?B?Y2JNT1RDT3lEcVNWZzlUMHVJUVd1ZTZycFpYa0k4VzhjT0tLM3VaeWdwRFUw?=
 =?utf-8?B?a0ZrOW94Q2NQWkt6aWJUd1J3ZjM0M21oY3dyRllGeURBYWx2dEQxc2dSdjUv?=
 =?utf-8?B?THl4RTFlQUp3TGZpUUcyYkx3Qis0LzF0MFUvNW1uQUt1OURoV1JjUld2SHdQ?=
 =?utf-8?B?TUJSYk14T0p5ZHU0U2gyMXJFUU5aeVNzNmxTbTZneU1BbFJlclNJS3lIMmgw?=
 =?utf-8?B?NXNGT3RzL1VrcXhqcjQvMGdUUG5GdThvRU5nTHFlZ3A4aUx2aWxJUHJOS21B?=
 =?utf-8?B?WDVxWWtzNGFxc1pENGlPTm1RYXoweGgrK2p1NERVUnRPUUhpK1FmbDliVDdx?=
 =?utf-8?B?SG56Y3ZQdGc4STdPbWFtM3VQTlBoaXNsZFRDcnVaZ2dZSUQ5ZmFyU2wzVGNa?=
 =?utf-8?B?aWZONlZIbXdrdlFXNTZDVUNXUUsvK0R0SzBRNlZVU2xubVlsNlhZZVhSVndz?=
 =?utf-8?B?Tnl6eDVEME5GZ05QeXUwcVZWWHQ3UUQzbVhDTytYUmtVSHhqMk5jcEw0Rmla?=
 =?utf-8?B?NngxZTJaeXRNNU1zODAyTjFTWHZZSmQ5bnFnMmk2WjNKNmRraWRhamkyZ2xq?=
 =?utf-8?B?U3VWWWNpM3hhTGcxUE1QZDZFRlZmbmpjUy81ZDh3Y2tMbkJKWlR1eEU0aHk5?=
 =?utf-8?B?TXROQlVSSVpveFhpTlBxaUt3NWhGS0VSUlNYQ2duRW01TGkyVlV0SUc5T0Yv?=
 =?utf-8?B?S0xod3luTGF4MWwxVUY3bjZQNkFjWlIrNTUvRlZhQmNhZ1hyVXpVejNmY0NQ?=
 =?utf-8?B?bnI0NDV5MWt0bktrV1JlTFpFcW5BTXY5STRuS1UrUis5STVBMWllMFJnc214?=
 =?utf-8?B?NVAwWUc5RndiSi8xbDVaLzdZZ3BmeHRxaG8yeUxRTG11clNwVlhjVEh2M0VB?=
 =?utf-8?B?Sk41QWJzQ2d1TzJvQjhpbCtPLzYzMXFaZHpvbldRVXBRaEYrcFlBZ1FrSmZX?=
 =?utf-8?B?VlI4Z1BhY2l3S0M4aWFLUGZhWWk4Q3kva3pRRWd1TVVOazAvVkZNNSsyVC9L?=
 =?utf-8?B?RzhRb1RTNmtQaDArSDh1d0J5V2dyK091Q2xFbTNiUXpiekR4OUFpUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b7660a-d38a-4a8e-e65f-08de626a53be
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:49:54.5210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oew9mO1ahQVFE4Ou/3y2gfCYdu/5rJehO6IQOQ1EeueRv8SltYoj22ViyHlYk47T7fslj8/JCOHu5b/ghcKLfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5884

On Sat Jan 31, 2026 at 12:55 AM GMT, John Hubbard wrote:
> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
> waiting for GFW_BOOT completion. Skip this step for these architectures.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 2e7b90b80877..2ed0f6d8d19d 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
>          let chipset =3D spec.chipset();
> =20
>          try_pin_init!(Self {
> -            // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
> +            // Turing, Ampere, Ada: we must wait for GFW_BOOT completion=
 before doing any
> +            // significant setup on the GPU.
> +            //
> +            // Hopper/Blackwell: skip GFW_BOOT completion waiting entire=
ly, and use the simpler FSP
> +            // Chain of Trust boot path (elsewhere) instead.
>              _: {
> -                gfw::wait_gfw_boot_completion(bar)
> -                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot d=
id not complete\n"))?;
> +                if matches!(
> +                    chipset.arch(),
> +                    Architecture::Turing | Architecture::Ampere | Archit=
ecture::Ada
> +                ) {
> +                    gfw::wait_gfw_boot_completion(bar)
> +                        .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW bo=
ot did not complete\n"))?;

I think the `as_ref()` here is no longer necessary?

Best,
Gary

> +                }
>              },
> =20
>              sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chip=
set)?,

