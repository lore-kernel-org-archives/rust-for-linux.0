Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020084.outbound.protection.outlook.com [52.101.196.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F321D3E2;
	Fri,  9 Jan 2026 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977210; cv=fail; b=fWRq+Y3/kcA0mIs3w+1R7NPcHATVcnUaxxsVAiRKv4rPeZ9BGEVijBuVEJVBDqfIx25sevwIMWVQ07iOK2DVa8fQF4OPPzFVh5YBBcvjnz/A8n7mkqY5cXrW39inT4LZT5M326TiXkoNRrf0yD53bhZ5f+uBf4cf7EN9Dtu96Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977210; c=relaxed/simple;
	bh=q+ROFLNw3xQboVVaSVudym2aUE2eSAAmXqPU/WW/gQ0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GISUs/eImsB1PSe2trSEugARllpDdI42Qu8WcShRv3J3HEWe3np/UlYKAyG4DyLVbSFb6Pp3IYidoW15xOFTTcWpe9JQCUn4Mw7s0vjuyLqODEfFTfMfnS2BgkUmTfRLKeTLEhtoduRQRxV2AdZPyXe2Ir+fyWkPCBxwWj4Puuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=L1KSiRlQ; arc=fail smtp.client-ip=52.101.196.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="L1KSiRlQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Piz5ehO1PGx6Oo/zaEIAxxPSOWAU+z9cGysGeBmQFv1990BUwYbCffLiboZOD6TxtDgB9he77xHBb71iLvpMA7slfA5D2bwONlWIpshHAQFG2yPkmXZrHWixj4/dIUzceblk0ZS7AsZqZesdgfm9A1Ct+0JpMqZt9ZJdPCwkO642jCKhYV7+bG8zhP96SnkNc5Qls/Axou8GghWtORCzVKnMsEafAJkbbtk/+xv77FCzR00rKU4VGxiqcjrEoOFzPcNrLIAnzS4OccXH1MLQfT+hrRYWosOU6uVW33t+EsuVBi7SFYe0HR3TwxfvpVZnWsIHqbcg8pIhwVbPsucYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdRCmoUdfAv7YIlBg47kkda1l4yH2pGPq7x8QBPnb9w=;
 b=bWrfHXPKIPck5dXnmnug3Cq206fE500L4zlzSTunP+3ZxbkcJtn7ogS/VdYKDrlLWDqfL2BUyr2R2obFoj7oFIMxArQoFU/pNPT1EMa/ojUA/zCcHLhOTg/qLtfP174ibPTn2TZzsFCxindGUohLPp7wvF8L3tHErw42ojaR3RCyNvswoi3MRYVIaQra3SLZEcqm6N3DKuVRFOF/RdONFPzZnV0+KV8LYn4Ju+efddgdRNHoTDZV/gpPpwmbTRwT7ChXatDUj0bDk1y0upPqkGI4KCIKmkQ6zAc/V8pL7L4nbNk+lxfj9Da/ZFfTZmEZFEUVirGut3GPnMVg1DfTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdRCmoUdfAv7YIlBg47kkda1l4yH2pGPq7x8QBPnb9w=;
 b=L1KSiRlQqQkN3mtuKIYSrDaplqqv4pUi4BvS+5j/EnUlhqL8U8LNxZ0Q3xJcj1sSVhPCnEeFMn+md3BgFy5q7sOHKsebhztEU5IAJLotyEntCBsM6cUHOP3vRdDLmmoJOXICjxB7Usxch1FP/g7d/MQXO3uqRMHNK49U5Uhy1wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3415.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 16:46:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 16:46:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 16:46:44 +0000
Message-Id: <DFK7M3CCUXLM.33VAXRHV6U4W0@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@Kloenk.dev>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-7-lossin@kernel.org>
 <DFK2IZSN3G5Y.2ESC7WN213SYD@garyguo.net>
 <DFK7GA22REIQ.1YSKLW77KQAWH@kernel.org>
In-Reply-To: <DFK7GA22REIQ.1YSKLW77KQAWH@kernel.org>
X-ClientProxiedBy: LO6P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3415:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ecf2b6-a42e-44ae-3389-08de4f9eacaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZytKU2lHTGVCQnNNK0hLenVnY2NJOXJsNmhtK1EzWjYrOWxweDhMMGlHTVVV?=
 =?utf-8?B?UzNkTi9YNmhrSjQyZHk2TTZqNDAvcUJNUGRjTnhraWdnWHU1NVcxblMzLzli?=
 =?utf-8?B?ZVRIaW1FVGhLKzh1UFo1NFhFYVVNOEZyekdZcWxSMXVIaW5sbCt2YXhmTDVy?=
 =?utf-8?B?Qys3NFpWVm91cXhuUkRSc0RUbGhVTFdKT2lVaTVDWHZObC9pZ21DQmRkbWxn?=
 =?utf-8?B?Z09MckVNbDlWOTBianhveXFoSXZFRE9XUm02QkoxWXpmcDFJNzBFdzh6MHFT?=
 =?utf-8?B?UC9MVWFZTlFxa2FRUkNRb1ZkdVpOeE83a2xCeWhoUFd4cnVCeTlKSDNPYWxR?=
 =?utf-8?B?azZ6Qmhid2U2L3VkeEVMbWc3NVN2bUljZ3FLK202anFZdldENnpCaUEzL3ZE?=
 =?utf-8?B?QlcyN1VCLzQrbkZsQXJDeS83cmh4K1VVYmVEWWVHNG4xcVZjUzlMN3FSbVMx?=
 =?utf-8?B?dTU3M0xJdmpkajBiTUNMc3A5azBaanFmTmhXRGFFUlVQcUtHRUdrQmdwcUc1?=
 =?utf-8?B?OU9Mb3A0VjQrRHZ2RFJpRnZxL2xZM3l1Smo1alRLUGFieXpIM2t1K2l3RHUw?=
 =?utf-8?B?aVl1NUUvbUVKQjYvMVpRaG1kRlFGWHlPNGIvd2tkdWlXUzF0Y3NxaUMreVBa?=
 =?utf-8?B?VjRhaHNjZmJuUjUzb2E2MjlabG4xTFg4Z2lQQ3NuSlJhSzQ0SnlqREdDOVls?=
 =?utf-8?B?Y294MVpyMTJGaFE0QkRQRDdpL2hFMERVMDdpOFBPT201VEJYN3A0YmYweVJR?=
 =?utf-8?B?cmxKbkM5cVVEekxGMCs3WVNnM0oyK05BTGcyYk01MWZsbjc3Kzl1V3dPVUxO?=
 =?utf-8?B?TGlieERVOEhWSUgwL1pUVkRYaVFnSG5DTmIraGN3M1B3MURvdWNjempBUU10?=
 =?utf-8?B?bWs1YlpiUjE3djJHNnhkNTE5NVpyVWU3ZDhPbVhodEcxT0NHVHRTWkRNQWRW?=
 =?utf-8?B?RzlrUUVSdWlJVXdzeDI0bXVHNVBBZXJoUGdZRklFMEt4SFFrRjY3M0VjRVUw?=
 =?utf-8?B?eWtSdThHbnpsdmx3Z1YzZ2VLN1RMRHk1WVZhTUwrazQ5YVBFN2k2eGRvYVRx?=
 =?utf-8?B?Q2JTTTBxb3Z1eDhtR3UzeG1BV3gva05INEFla3ZNOWdqbExIL05ML3BodjFr?=
 =?utf-8?B?K0NVNGxFQjU5SGdvV09WZzFIR2hjQllsSUpTQnRKRjVlUlRqYU1td1AyeUJw?=
 =?utf-8?B?TllpNmxjclRYQVl6NEJUd01rZ1ovWVBDdUlzRFY1anl4U1FvRCt5eHZoR1NE?=
 =?utf-8?B?UjZhRkF4dEVGNlpTL2FaWU5CSVhQS3ptNG9uSjQxTGRqV2Z0eTN2WEZ1VTIv?=
 =?utf-8?B?VEhJM2d6RGd0WkVWMkRSNmF1bWwvSDhZR1pjcXBnYitCd1VwRXlUSldWWmFa?=
 =?utf-8?B?d2FMZm1nRGJXQ0tBR05wS0UrSFJaYVExeDZrSnduZ3l6eGNlU3oyM00yTXQ5?=
 =?utf-8?B?ekJKT1k0QzRLTFE4VU5QaFJiU0VjZTBDczNvSElWMUVRVkJIVU8wTCtMajJL?=
 =?utf-8?B?UGtPRzlkWUE0UE9EaXBpN3kzR2R2QzVYYW9GUkw3VVJObDArOTUxdHhiWGMz?=
 =?utf-8?B?ZzdiY2NlZHJTVEk4MzVXWDh0aTJZQWwxN2pScU5rbW90QlNBZE9vUVRWeGFM?=
 =?utf-8?B?b2Erd3doSUV6RllKQ21NRlprYkNXSUp4dmZuUVVnMk1CdDF5SDVyR04xQlV3?=
 =?utf-8?B?azVpbWp3dUQzZ01YdXgxalhwa1ZEWTJuc1VtRmptYjloWmEvNDdSTW5aaXcz?=
 =?utf-8?B?ZVR1TGZhZ1BCbEN3aElOMFpZRmFhTytFRjZma0lyWWNWNU1TejdvRUhtaUdH?=
 =?utf-8?B?NFVvdjVJS1ZUTFBScmQrQUpEOGw2UHdidjZSUWF0Y3JOdExXUXpxcnFyZ0M5?=
 =?utf-8?B?TFdCakpTeGpDaWNRWTNQRTA2SWgxK0VzbHpjL3lhWkRUZjdlbE5HM0JhN0ox?=
 =?utf-8?B?MDFCNXowMDlJbHRLcGpmbUwzZlpVY1pPazY1VXloSHNpaW40cHl4d2F6T1lR?=
 =?utf-8?Q?9xtAfsYXGkz7LUxOUnPTwMlHZmeOrI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlZUNW9ONFNtbTdMK3VZUzBvTVR2dzVNSSthdnFqWmFhSGlVMExKR1F5ZktW?=
 =?utf-8?B?RTg0Qmt1Y0tkT0ZXOFB2YllrTW5TSnlyejhabjBjTmhtK3Fjbkl6Y3pHb3RP?=
 =?utf-8?B?NE9rT1pKQkpEbjVjUG9teXl4NUZ0QThYR3RWOG94YTZNOHhjQjRoSjRCTERF?=
 =?utf-8?B?c01NbWVyUmRXcStsamg3bDVtMmdUOHNJd0lsUEVyYkRBODNwc0ZXWWIwN3U2?=
 =?utf-8?B?Yk82RFhmRWlGYllzZFBTSDAvMzFEekVVWUhLYXlzZEdTb2FhN2owV3c2UW5i?=
 =?utf-8?B?NmZyZmxPRStyV1NOeVNXYm1IWUZKSHVMa1YycWN1dUxXa01SS0hlcU1hRlY5?=
 =?utf-8?B?MWo4ejlOM2c4Zlk0TjMvWG1iZ3pIMzFUK3dvSGpkN2VITFdQbkhTMGlKaGFD?=
 =?utf-8?B?cFFTaThFRXlCNVM4WGExYU9MTFc5S0hNOTAwUldVbjcvSlJGSnhRTkxFVDFl?=
 =?utf-8?B?M3FPMGFKTlR1dG9XUjE3R2plekUwRTN3cnFTeE5EMmtoMnNZZGZwTXp3dTlE?=
 =?utf-8?B?QWVnUFBnNXFtSlJRbVBrbU5tM1YvaWx0OGZHeVBvSUhYUldmOThqUG5Wd3Fj?=
 =?utf-8?B?bmpXNVlRazZGUHU1alBuMW5rTlBxcUZLdjl5NkRYK2c3aEx1SnBRa2RCWVZm?=
 =?utf-8?B?MVdXRi9NN0NhTlRjQjl4cEZoNlZDQ3E3R1lZTTNQZnpMc1JYQWhNSUpzWlMr?=
 =?utf-8?B?cUFlMEs1cTh5T1dkaXQ1TXo1UFczcjdMQnROTmpBN1N4UzdPTi9aVmdsVmJk?=
 =?utf-8?B?WSswdWtjTGkrK2MvNVFGZmJzZ2E0UFhoekpLVlVkQ29VaTFhaU5jSTUvZ2tU?=
 =?utf-8?B?dHV1KytHWnpvWmFUcnRXVFNnL1VkYzcwRERBbk1qYWZDUXJQbEtiYTZGTHFK?=
 =?utf-8?B?ZmVaQzNwMEJBZGhzZUhjYnlKeCtTWk9VZnVPekdzMEQxODJla0lQU0V1MTJu?=
 =?utf-8?B?b0ROZ29CdjZGOU5qd2xZRGJRQ0tpUTk0ZzJIbkZVNFNaZ0NOSFkrYk1kRnor?=
 =?utf-8?B?MThuQm9LbEFXZkdlUzk2TWxFdTYwUzY4K05Dd29FWWw2UHlod2dCN2FoV2RS?=
 =?utf-8?B?K1hoL0E5ZFpYSE82NUpnWHNVaG41VHZWbXN2S3VRRVgrNUU5L3hSUFhVcnRN?=
 =?utf-8?B?TkJvdWpRZCtIR2VMQ0V5N29URmFZdFYxRVkrWVNYSlZzUE9xN1QxNmN1Nmda?=
 =?utf-8?B?RHlLVFNKU0FqbFF3RUoxYXp3a09IeDlIOVJEdWtWanVNelIxeXNPaEhrTTdZ?=
 =?utf-8?B?K2dyOWZuR0hMWElXZHE0dkhOWWxndVJ1VjdGNVYremtBYVpyaVF4RVZBVTBk?=
 =?utf-8?B?SjNiUVJORUI4Sng2Wm5JcGI4eEk3U0hFY0JIYzRUaURhV0huVUIzTWtnMkVI?=
 =?utf-8?B?SUlyREt4K3NEc2Rrc3dXTkcyWHF0VzVNbWlsL0ZCWTl3SGZWVE9CMmFIWXF6?=
 =?utf-8?B?Q2dzYVBiS2g0VE8rQkE3anAvenlLREZQT1VzSHRJUk5tNDd1ZmkvUU9FWlF4?=
 =?utf-8?B?TEVjMDBIbGwzeFlkYWY5N1lFRmxheHFWcjRYY0xvU29tVHJwZW9nM0JuM1lF?=
 =?utf-8?B?VWE5TWdhTjV5Qi9ScVRkWlB6amVCZXZNQVVKcTUzMnhwb2cxWlZ2Y1lSUkxY?=
 =?utf-8?B?S0hPa0N5YzJUZDB6eEdVRnNMdWQ1Y0NPRUMrbnJXM3Z6anlFWUFvU0JPdTFn?=
 =?utf-8?B?RjJ6VFRHZkdEc1VXQXQydkdTdVoySW42c3RGajZjRjhkNFV1eEFteTFhajB5?=
 =?utf-8?B?aVRrQ1JBSFJaQ0NXQW1TbTN2OFR1VlB6alpKb1k0WVVhbmNFV0VJWGx6SDFh?=
 =?utf-8?B?S1V0MWVTYnllamZOaXB5UXhGdG52R2h1bmdNVHNKOFhpWDQ0TVphNHhsQ3Zh?=
 =?utf-8?B?b1RwYS8yU2R5Q2xNSktWNEkvZldTWVJDVSsrdDFZSkFpN1BjZXJaRXdSS1FC?=
 =?utf-8?B?Sk0yZktERnpOaTZqWHoyRlIxcnF4bkZTT3BXK1lXWERnaEJDaWhZbk1PMXYv?=
 =?utf-8?B?NlRMcTZKOUtTMmZwTGQvZTg1aEcyeHRzRS9ZZUtrVSsxb0p4OTQ2bHB3bm9B?=
 =?utf-8?B?N04zMUR4QlRSa3k0Vm9wZWtYZnFwQVorcTJEUHpFRC9xNXFjMFcrQVd2NmZm?=
 =?utf-8?B?ZXJqc2JXQXFJUm4zNExxQlpWV1VKb04ySTQrREFJVVVDOU10SzRhNTJBVVBC?=
 =?utf-8?B?L0oxQXFhZWUxT2YyMjF4ck1qb3RaVEo4NFR6STlmYzhzUlI3VXU3WnBLNWhq?=
 =?utf-8?B?TDRsdmg0bThNaTNmaFZSVHh1KzRaL2hSWDIwcElPL01KUUVtRGFvQW1Ddmln?=
 =?utf-8?B?NzA2SWIyTVBveEZJQWRSbnVwVDFUZXFpdUdQMmNNUDR1NGpjckFxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ecf2b6-a42e-44ae-3389-08de4f9eacaf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:46:45.4325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4g26LQAHFxz0+yH1l31DWtyzv7tAxFQDfqmz5v6BP7/6DhutH4N74lHcHkQvPPxXGlZSIO5IYksg55fshSpqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3415

On Fri Jan 9, 2026 at 4:39 PM GMT, Benno Lossin wrote:
> On Fri Jan 9, 2026 at 1:47 PM CET, Gary Guo wrote:
>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>> +impl Parse for Args {
>>> +    fn parse(input: syn::parse::ParseStream) -> Result<Self> {
>>> +        let lh =3D input.lookahead1();
>>> +        if lh.peek(End) {
>>> +            input.parse().map(Self::Nothing)
>>
>> How about make this `impl Parse for Option<Args>` and remove the nothing
>> variant? It looks a bit weird.
>
> `Option` is not fundamental, so I can't change the impl. Parse doesn't
> have a blanket impl on `Option`. Maybe I'm not fully understanding the
> change you're proposing.

nvm. I forgot about orphan rules from time to time.

>
>>> +fn strip_pin_annotations(struct_: &mut syn::ItemStruct) {
>>> +    for field in &mut struct_.fields {
>>> +        field.attrs.retain(|a| !a.path().is_ident("pin"));
>>> +    }
>>> +}
>>
>> Multiple places have similar things for stripping annotations and checki=
ng if
>> structurally pinned. Would it make sense to do this at the very beginnin=
g, and
>> build a `HashSet` of structurally pinned fields, and use that as canonic=
al
>> source for all generate_ functions?
>
> There is https://github.com/Rust-for-Linux/pin-init/pull/94, and I don't
> want to take away their work. I'll contact them and see if we can fold
> it into this commit/series.

I don't think that's the same? I am proposing remove `#[pin]` and build a s=
et at
the very beginning of `fn pin_data` and just use that set. Which is not wha=
t the
reference PR does.

Best,
Gary
