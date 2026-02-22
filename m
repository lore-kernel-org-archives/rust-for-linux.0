Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BC52F851;
	Sun, 22 Feb 2026 19:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771786998; cv=fail; b=nscTR5a5SGD2CPElYWDkMC+I4iUbc/7ok4n1p+A2n5xwfHNT8pHap3fDLcPqaCmmlQYdqWWsc+LBNGIx3aEiK5bmNxbrGLL1D6pcC9W2xsGBHdhkvYdEXRQoR44ugw2Aqqu5AEmkzS3fBaBF/URqin7mtunNryamrd1IRcv4mIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771786998; c=relaxed/simple;
	bh=cVR32zrw4D9grSHgnMYx6C9/0yGgRjvd+fN6mEfYlGw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hWg2DUTIW/I7j9fgdOd95Sbh/pMndttazlApdCGCXosNpgZMK81CkUCxwdSYd12bGQpEF8mZv8M+EMhMp84S2i7CO0jUctj8OFU+d3AIyeaL3hmQSzCLgFPGQcVgM13h4Hwue3jiboJ6rTlvxVcTg9Br+3xxiTcqpLvz1ztfpHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hjdoDHri; arc=fail smtp.client-ip=52.101.56.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hjdoDHri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn18zoHukQzbsdts5jQRWFulUObjI77qIKleJYamUZ+5/aCFRhsr91CzuAQMKiZrVBQEd7Yi7JqBtVI0rH8QoEL5Q4r7opyXaIFkzjg2kI6bsij38BZ162O4jdjnii72mYLVQB02oGcsYmrRf0K1SNXQQn/oQfKhRLet6hsFSnwhkJKvtw0m8dvFFegHR5fUyREYqEArci/K7WaUqHxtaCXnon3TLHI6G1HiCUAbhBTp830DwgtcKXOQamvIcDPSh+I5lin07RG53/YGT3wxBOGh38cJ5eKgkk9Natq0YSve8zi8Fxh7F3LSHsMGny1XzJ9MMBFmNDjCqdQPwUltKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c1Vpws9Pzy/fJ6+H4VrBCeM9C0sRGqug41Syf9JtNc=;
 b=fG4OH9KZyYn0623WAvSlDPFAwjtaeYG+IXWQsbSjGQZDuavlo/dmsItdbts/Avd+hMXXvnlrkbwJhxqRzdX80FrwUlOGHCXTgBME7qWuTOoFJlPBvR5EY5bxszBWjxSK5+PYibk5WdvdvEG89rHg/ur//M0HzjdSiCzxbl+QpIxhO64Tj9/sh9UnNthggP4MxkK13hjoVAM8k6OzS6tNAhFdBCuN/Tq3+zSlij9ix1Wl7VqC83nOAattogXZu75wSKfJi+qLc58ome8SY5lEqzLmRGgNLxk5x2ICCHedhDG9bOiPj9DsXbfHDEw2+TQKM8Ach2EyeNExz+GY1YEEFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0c1Vpws9Pzy/fJ6+H4VrBCeM9C0sRGqug41Syf9JtNc=;
 b=hjdoDHriKQWUEOejQtXYZ2Fm0J2a/5NUGYIoos09BlINgn9GEEnYJLNoCv/3TQh5tku87tiJog9k3FslEB/j+vieCziQGc5YmlXr26XOBXFTjCM8YjLqqIXWUMT/prWaFzAA7pi9H1E1LiuhnA8g1r1hA4Rm3Yg66DzIcLERzuizBwigaUfEYsrRA7DF3BcXYGZ23fjXeHBgopUz7ZuI/gCGdOH2/4BmT2FdQpSWJHLBVZSFZC5rueBrvL9Fx+0pH33Ek2f6kWJtJDhtrwOUer2X5+KgKkM04QPISIBjnPd0mQmGoe13TPgHUHPl5mLfmai1jHdHTM1K9cd0FGtmMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Sun, 22 Feb
 2026 19:03:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 19:03:12 +0000
Message-ID: <86600a42-9eef-4c2c-84c7-112f5b9b2509@nvidia.com>
Date: Sun, 22 Feb 2026 11:03:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ0PR12MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 300ca6e1-ffef-409b-6e88-08de72450691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0ttTWIrZENuK1RaVUFSOFBnWUR5cXRuSjdRV1NiRVpJai9YRkVqMXpUSnNF?=
 =?utf-8?B?NEZYR0hxS1VoTnlwbEtCU0h0dUdqa2JSSkpucDBOeEQ1eGExSy9iT2RyenhM?=
 =?utf-8?B?MzgrUUx1Q2JrSzVqUXlIK25vR0tYOVNZakN5cHE2RTBoZW1JbXZ1OWpPaVFt?=
 =?utf-8?B?ZTlCVjQ0Kys4Qy81S2t5ZnNPaTBvTFdlSzVRQVp0UytlYW9RcCs5UzFZcUI4?=
 =?utf-8?B?Q2toRSt0YjNmcS8yTFVueTF5a2VNbFc4aWRqM0JWVWQ0bFJjck91b09hU3hj?=
 =?utf-8?B?Mkt0SnBRdDFYMGtxWGdPdW9WeHUwdGtWcExEdTN3UkNRWXJFejYwR2g3RzdS?=
 =?utf-8?B?WlpDMWh2eFFVTEZYcDUvR3E0ZDFGZUNjVUp1bFhSU3Nnei9ORm5KblFZYmFT?=
 =?utf-8?B?R2F1eGVlVlAwaGZXUCt5Zjd0aC9jSXlOc3BtVFBpdzEyVUVuWnc3RFovKysy?=
 =?utf-8?B?Y2UraTNJMU42YkllMWIvMytYR2ZJTkpENWdSKzJwZEVaK1Fha09qNTlkbEVv?=
 =?utf-8?B?Z3JXTk5VN0c2RmI1WVQwR0tvTmVFa3JQVHlwL3BzUTJhVnE5OU5KNTlNS0Rt?=
 =?utf-8?B?QXhWSFR5M2JtUTVjZUJIbkp4dTV6dTFIcmJBNnVHb1cwUzkrUFQxTGFJTFFs?=
 =?utf-8?B?S0k4UHdYSFlkWUpaeUdtZktPNVFmSTlKYThJaUFESGxxUEs4VDRETTJqOWNl?=
 =?utf-8?B?VytmSkFES01zdHh5ZFZwWTJVLzVmaFRLc0RiT1VOMGVBZzZ6R0RDY2VmcnhG?=
 =?utf-8?B?bnEwZ0g1M0lxWGY4Q1BtK3JEUWZpcGRMVkFlWDFGSDNiczc0eWhmeURXNDBM?=
 =?utf-8?B?cWNpMFRKZDZMUDkyQXA4WGtNZlBjZGxrV3JqZDhiRUZyUDAwSWpLN0NkbjVS?=
 =?utf-8?B?VmFRMWJqMUU3cGZEdEcyL2RuYkVvWkpQdVBGNUJMTmw4SXI2bXp4WlpLa29v?=
 =?utf-8?B?L25LRENIZWNGbWpUMW9CUzFLM3FKU3BvdFA4Tk9zNmVnUHJpaFBBby9WRkVC?=
 =?utf-8?B?Ti8xREpuU1FYVHE5TnJCSWVyZFhPNmVoSTRxdUo4T2x6NmNWazVNcyszeDIz?=
 =?utf-8?B?b0pQcTVEQ2NJcSsrcENwRGtvcHd5U1E2Z2w4Q0lpeTZPSFpja1ZZZ3ZTVlJR?=
 =?utf-8?B?UXVuSUZWR3RKKzd0TUxmTUpHazFpWHpCRTNLeHZSRHBPMXJEeFNwVnBOdGc1?=
 =?utf-8?B?RStHK0ltMzcyOGJKOWJGL0t3VTBJcHlkMmlhUlVWQ0xCSHFOSFlYelU3cHVi?=
 =?utf-8?B?ZzJNY05Ld092L1FNT1dtZWFpWnpiSWtuM1hXQlNSV1hraXFWNUZaSGgwSHN3?=
 =?utf-8?B?MkdXOXY3bjAweUMveDFFdnpadDFPTUNBTWt4TzJmQnVaZWJmUWtIWXNvR2V3?=
 =?utf-8?B?TkdWci92MThKZk9HMGI5Q2FhN0t5Z0s1SXg1SUhDajRPaXNQY3lXR1pNTzRi?=
 =?utf-8?B?aWxIMmwxT09CZk9tSGtiWkI1RVlPU2FzSUZzVDUwRjhIK0kxYUNwSkhXRE4v?=
 =?utf-8?B?UXhpRmxITjExRDJnTjFUNUtDU1NSRjdkOU1yYW4yYk5RQ3FUL0w0OFFYOFFq?=
 =?utf-8?B?QmN5UWpjSVZ2SUZPczZJMFBLQ2g5MFU2UytVNGZxK0JjS003NFJJTDNoZ0hx?=
 =?utf-8?B?OXpCZWwrZnhiRWo2ekFWY2VWdE5wd2hhTklPbmVJcytzNnVjRHJoT0gvOFZN?=
 =?utf-8?B?N0d4Q1Nma21OYThpbURaVzN6Rk5IcGkwMVMyMWRhVW1leVQ2RnAwd2dEL1FB?=
 =?utf-8?B?VEUvakhCYWR3dnVVM2NDb2J1YytsaU12amxXQ05MU1dqMHBLUU5JQnpTSHpx?=
 =?utf-8?B?aFFsMnBRL2Vwb2xpNUtuTlJRY2hnaGlmOE5WSWkyQU84d0lXcDdsTzBCMnA4?=
 =?utf-8?B?Z212cm1kRnBQWm5hcEpFczBKTVVNMmtITm4vaW1Pd2F3cjNpdjUzbkNGMWhl?=
 =?utf-8?B?MFhvMy9HRlZ4S0trUGpGc0Q2ZC9ZN0NReFFzZkRaU0pCVFlqWWFRdGlsU3Rj?=
 =?utf-8?B?RjkxWVU4eGwzeFUzdW5ySVhwK0dkdzdUSEdoeHdPK3hISzBPVWRDVWVtM1Yy?=
 =?utf-8?B?a3lFT29NbnB3MEgvc1ZJV3RpN3ZFalV3eHlkckJuTEt1b0tYdXZYWlgwZHVm?=
 =?utf-8?Q?Xc8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE9kdCtDcEpHK1FlUUViVlZzMzdWWWhqZUtsVTZyTzdaWklEdVFLcnZOeUs4?=
 =?utf-8?B?YUxEckk4TXpzbzMwTGx5TVVWZTVEdEZmSlhUajJDaVpTYkNENUwrcXBZNEhw?=
 =?utf-8?B?WG5jb0lldXA0ZnRvZTVTSnhPNmpDQW90b0h2TDJGUDVHd3kzeWh6UEZxcFB6?=
 =?utf-8?B?TFJjT1BJbXZ6YTFWRUgydHhLV1BoSW9ueUt0bXNkNW5xdG5JSFNldit1LzZK?=
 =?utf-8?B?Nm1XZE1raTkvL09ySno1anczbVJpZlFQVzY5RFkxWkluSEtKNDJENWhNdWlZ?=
 =?utf-8?B?Yk8zRUJtRmkzQTB6YUxNdExua3lXQzQ4UDlJQ2d4Q1prQ2lCc1hKb1Vsa1g2?=
 =?utf-8?B?Q3QwOEROSDVVK1hZTGprQUVaRmdjTk95WUhidDQ0bzlHV3Q1ZTFLMElsWXdv?=
 =?utf-8?B?MjI4RWFOUXpEeTVvblpMK01EMEY4WUU1OVZlTXN1alpuTEtrWkdvZmkvRm4z?=
 =?utf-8?B?TnN1MGlkZnJOb3BoK3R2VUJmTXRyMElZditvZ2lGdnRzVmFFZnh3OW45QlRv?=
 =?utf-8?B?UXNITkVocXlEaTlURGVKY0gwaVpqOTY4Qms4SFhBQi9NaERXL2VQMEV4cUxl?=
 =?utf-8?B?Z082Ti9ldFV6amRpajdOL1dkYjJ1WjU4ckJ2V2JDcUw3K1ZPZjV2cVc4WUZ1?=
 =?utf-8?B?QzBNMExpNFpPTERHV3hJOHRTVXB6K3FUK1pPZ29IQ0dqTDExVXN1d0p0azM2?=
 =?utf-8?B?c1FGVUt0NVRIMXQzTDJ1cGVNcUVYV2Q5YTFTOC9ickE1Q3RyQk1UWFB0ZE9m?=
 =?utf-8?B?ZHRuMzFteXVlTER6UVluTkUxZjhNS09OSGE0WjJGdVluWjJsTFR1K2toZ29u?=
 =?utf-8?B?TXFHMFd1TUdYdUUxb3BlbEJGRm5iRmtLb2lsNnpLSmFWR3MrbExLTUszKzJl?=
 =?utf-8?B?SXg5RzdKYUtad3YzYzFRcENYRkxGbFpralVYR29wbTlqWjBNdjJJRkhtaDFk?=
 =?utf-8?B?aWNPem0vVkRzU3pnZW53SkZadWFQQ0hmZ1ZsU0Q2ditNckZmblBlbU5veFR3?=
 =?utf-8?B?NWM2aUdadkNHUXgxNnZ1d0o3VTh0VHcrc0NjdXNtNmhQb1JNVTJDM2lsaktw?=
 =?utf-8?B?UHdLWEhISEVDc2RJVEwyYTdHSjk3K0ZzU1hNWC9LMzY5QTNGdmVicWtlSnhU?=
 =?utf-8?B?M2x1c2JhMmYwcjlqN0FIY1k3T1RBdWFMeGdjdko1cm95MHFLb0RFRU40Zmxx?=
 =?utf-8?B?ZDBPM1haU0duZ2hEYUtFMWhSYXU1czRYNThwRDErTFRaOGNGdmdFNmk2S09x?=
 =?utf-8?B?OWloRkZWbjhweXF3cGwvdlRwUXJqSzBkc2FhdEtVR0JidVYybXNzeDBoT2dq?=
 =?utf-8?B?anFVMncyR1R6clVqelliUmVsbTRhUkZETnFRYWxSV1Jsd3lNNlR1VnltNFZK?=
 =?utf-8?B?R1FrUDlZTU9MZW12MGtoL3pYU0Z4RVdsOUtCVmhuQXBCdmVWQ3BuOHVYZDQv?=
 =?utf-8?B?SVh5c0JJUXVnNGJEdk5uREZCYzZ3eS82OFNwcmxZYjU2em5hZnlpNlYzbkt4?=
 =?utf-8?B?NlBmMHc5YWQ5RjJPYUxCZWhOS2MrSWkzY1NyejFlRkdZcytGWnRrR2ptZDRk?=
 =?utf-8?B?WmJnNnlXUG1qaSs0REhzYWhlNkVnb09NLzFmSUpQTWYyQUovSStLZnVDNkNU?=
 =?utf-8?B?aWdobDBFWmhJR015VEhXYlFsY0diZUxOc0NNaStQQUlrYmRxVW51TFUvdktr?=
 =?utf-8?B?SEZaWUNZS0J3RTU1V0IrZVU3QkRhbVozWkN5TUkyMVoyM281cG03Y1owYnYv?=
 =?utf-8?B?SEhFUXhlMDVBaXhqOEtJTHpRdmxZbVFDSE5WWElLc1o4RVJMNzRPRTY0em9C?=
 =?utf-8?B?QlB0N1hzbnFaWTBNTFNnVWtMVlBqTUZmNzZuQjB5OTRiK2ViQ1NGMlVxMHRk?=
 =?utf-8?B?VWRXTkpUQ3g0Sm0xL2VqR3JoQkVaZ2lCRmpOZXVxbHJqbnBTN0duMS92NFU1?=
 =?utf-8?B?MWN0bXN6Rkt2ZWp1L3ovbDBxdkRFTGQ1VXpUc3ZiZ2xzTWFvZlFEcktzUlRH?=
 =?utf-8?B?RkdoQ3M3VVBuQ2FHM01ZTWFyY3R5ZVFoVjhWemVRVUkwdzJCTm92OVhnODBE?=
 =?utf-8?B?MGxrSjhoL0VBUGNKb1FSV21pdVNteWxwRng1NTlXZGwzVXJla1g5N05YVnNU?=
 =?utf-8?B?V0ozbDUrWTYvVlVQbitqaThNT0ZnMVZIdVZKUmt2alNVYUozdDIvWktWUjR3?=
 =?utf-8?B?NmgwWWxpREQyaDVmQmFxSDIyS3RuQzZhUzliQzBNOVRJM2pQbDd5R3I0QUpN?=
 =?utf-8?B?SmZUK3NhNTFWVjFPOHJKanY0dnNkaFJFaWRvbUVaRVlzd2taVEhwM0RZM2Yv?=
 =?utf-8?B?SlFZOURVMVd1ODFGQzErZlA5UGcvenVPdXRtbXF4SmxOamgzMVJGcU4zZjlL?=
 =?utf-8?Q?4aS9QFlQ3xHsqnRg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300ca6e1-ffef-409b-6e88-08de72450691
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 19:03:12.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUydl8tqDqDrB3JEeJ7JjxyJboOXfkZghL7bNEuFNWi1uu6ykIIR145V2VN8t6jiohN4WmuxJAoKFSl0oPwRFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

On 2/21/26 12:50 PM, Miguel Ojeda wrote:
> On Sat, Feb 21, 2026 at 3:11 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> [1] https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kernel.org/
> 
> Link: https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kernel.org/
> [1]
> 
>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
> 
> Ah, I thought you wanted to put this in `drivers/gpu/nova-core/num.rs`
> like in the previous version.

Works for me. I was anticipating that people wanted it in rust/ but
I'm perfectly happy to keep it local to nova-core.

> 
> If it is here instead, then you shouldn't need the
> `rust_allowed_features` change anymore, because we already enable
> `inline_const` in the `kernel` crate.

I see.

> 
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> 
> Having said that, if you do end up needing it elsewhere, then please
> add the other line added by Gary's patch, i.e.:
> 
>    +#   - Stable since Rust 1.79.0: `feature(inline_const)`.
> 
> Thanks!
> 
> Cheers,
> Miguel

thanks,
-- 
John Hubbard

