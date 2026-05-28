Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022080.outbound.protection.outlook.com [52.101.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65AA3EF65D;
	Thu, 28 May 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971717; cv=fail; b=ksD0GtVlM7FI+rP/m+nm6EddqiIX0jb0nh36BzueYtYc+EEGFjqSM6tF1PbgYhUCpHiOx+Yx+5JVc1XMjeFswxi8XbyN7aZURMKxFv+yKjcbeL/NfWSCOBhefLLiNY/m8pop2QaXwy6DCysOUB0UVuOurmNu7Z5i9EuSeCqA3+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971717; c=relaxed/simple;
	bh=hwjmgNoV3uaMJIbyq5cO+5uyoAIfqbYj9pziVxDNzU4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UZz7z2EFazlDxzjAoREyLILPfOc8SzA+byCOqYqtjTa3iAyxu/UUSoOloXyl1L2Irz0KEG5otVzrXxQqWIZi25I7HgO7G6kvMPAWdI7tSOog0xJbToLN6bTpK78ZkHcOYjsMwvwtM5BWzORcIubjmQU9riXQ9RHddMa/pS0Pqfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Fz4ZNEQX; arc=fail smtp.client-ip=52.101.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Fz4ZNEQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlkI4prEoahMZoO1/Jb6g83KrDvAM3ZCACHzDQ+Z+rpAL3YGxyrXI76aHel/LD/52OSQi+QEh3JHWn1NSfhzmdFeR4IX7+6MDuBU/YXB7tDT6OFIrZBkLMLIWNjSEZc3YcsotOvLbxcdpBeQdO1tCvOgf+K7FAAJuI1Ts/0twlGDaYnYCLip+VDUjTp0p5+CRUZ2U04bUTQEzoufFncL3lCMdB/FoJBafICf9KVc/9jDBzUHvxai76hk94tvpjeWMw3KGCDqg5BOHl16kph7b2kqwoBBn/oeRs0ElsKe5qEKKCoXOFlxl/7xUyZWOWLb3MYjYFrfSzU3kIavybRegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdwYKheMKJDpd0r/I63FH9fAvOLpdcixeHhfRPNHTxs=;
 b=sK2hrnA1QCWLQRLg8UnLRkel/ut7qfl6QCW6l365vp4l4/qvFYiSNs1mWr1Mzzyuqs5P42h5jihv5qdxvggCDwgkCjey+D+VBAkcVpV4VDI0dSSgNMlJu66oFC/DyORv4RBJ0U5WNNFSJpNZeqVpherDlge9YVu1FjcWgDFYz3hCuS2Ua+X51bqLg5rflRaZ+06JUJOVLbeoyFDthuM9xRv0JHjUZbFQ6b2EkblW0Zm/jnlGcPz5D2zJzHAb0Ep+CYG4FTigeSqbnojqNseFF10/AwY4hqpa1lTm5FaEecRxpEMNOSX5gn9h64nK2/p2OACuAnRV4Juqok/EMs1dmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdwYKheMKJDpd0r/I63FH9fAvOLpdcixeHhfRPNHTxs=;
 b=Fz4ZNEQXWPtsIUSEVkNPg2mQnWjKcPv5KWb0lShjQ8o1SnbsNYLGdyuooh27MED86BdJ3PTOcOvqTJqyLrUzuRzXN4PLIx++Af93qlxDJbCEDzunJDs5u/hDeddt9+x4Wlx/iOrCi4a9QkmvC4M69W8ZIz6QYq7n16iOYTwxweQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LNXP265MB2523.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 12:35:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 12:35:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 13:35:11 +0100
Message-Id: <DIUBB7WFVZ04.1STVFBTJQPJQR@garyguo.net>
Cc: "Neal Gompa" <neal@gompa.dev>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
From: "Gary Guo" <gary@garyguo.net>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jonathan
 Corbet" <corbet@lwn.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
In-Reply-To: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
X-ClientProxiedBy: LO4P123CA0604.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LNXP265MB2523:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc03707-3f47-44d2-822a-08debcb58ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|921020|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eDJSbM+mhB+iB3qHmAyksXJMeG/EyOceojnBYSuNrov0Ft4zuv/gpfGry3afDgekZhWKyq7hZIQk+j3f0IBRqYre4WVIR60CRwmTug+jv3k9Sjplb1HjHnIk5CywGWlVTJDmWuz2XkpYw0DUv/Bso8Rc0Td1343yGXyh8ZBEAw/6RDHD3OwGXhJx/ONQwb8tYXL4CXu64v0fB3IcbGKgC8eMXljmiLLe8Gj0/LxPuoIKx4ieoetVcd6PVhb5wZLhM+SzpWGyhsaMyUI4qIkohQV4tdrNrID1737T2D/Yjk61ZcN0/ZPIP7lHB/Yclw97VLcDvMv/YB8aaIAvo131wyuKdiT04v/lant/27KOMNuNAxMqOOwyitAu/gLIb5evRuTVr6WVDSkIHiaOWvpz1KwTMpD5MN5dUvrIX8UwZl0shODWyyQPZpTHdNwg98EDPRtlEWzOindN2+S30IMwmbhkseCieX86PLu27hoWFeEgO5vMbjEBWJUOOirrG5hLBQ1YYOYq7y6/nr7hlccU2gTCxhgnbwIscFvB2+Cuv9j3jY5IarjurrY9HY4Ym5xLfPXdCQQRTXxYn087VRN4LbVl5ewl0P5HYmyLnhaVarMEI2SgP7EpQcA8hEnak64O8ucLamWrHr2tzwuP/YLYCJtEmXN6zOawHrMrzaKki3iJ5tsVwZFLGneKFUcUc6aE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm5rUDRnSjZpUVdPR0gwOVdiOFRKVmpMQ3V4UHpoYzBieGU1dHBrcUhyNWJB?=
 =?utf-8?B?b2RjdGg1ODNHdFpycEdkUkx5T1JmVGw3bHdOSGpKZkFZWkRPVmhJQU9NUlF1?=
 =?utf-8?B?NWg4MWg1NlllMElDZzFOZ0RpaFk1dEpIdzBSOHdOWGdpNDRKNmhHRmFiRmdK?=
 =?utf-8?B?SVZUb0tmMSs0Ti9KcjlsQ3hZYmtDaUtVQmJJei9hTHlGYXp4QVczckRvMEFz?=
 =?utf-8?B?NDVaSWVQT0U3REZUeTRhTkRnQ2ZaNkxEMXJXVHh4Z1FNbDJkVHQrK0NFNWEw?=
 =?utf-8?B?L2ZrSVA2V2hORlUxZWE1YnZES0gzcDU3SDlMZERPUHVjTFhwV1BkWVFQczZL?=
 =?utf-8?B?cGE5YnB3a0YrYXN0M3VCTTN3OFRpRGoyelhNdDluN3RibXpaMDQ5dkV6RDlO?=
 =?utf-8?B?eEsvRG8xamEzNDNWVlhoc1pjb2hMUTF5eGhpTmtaczE5NXltWEJCU2FLK3hI?=
 =?utf-8?B?d1AxRmRUYzliYkZ6b3JEU1JmT3JjNXZuczlNRzVLc0YxbWxlSXlDZHRTamhx?=
 =?utf-8?B?Z1BGdDhyclNFVklabXYyV2RYT0VtV0h5K21naENsWWhwRmU3eWhqaUhVeDIy?=
 =?utf-8?B?Q056Q0p4d0NZbGREV1FDZmJlMlZmYmRTVm1GM1BzdGFqemp0b1JFOFBWSlc3?=
 =?utf-8?B?ZGtGTTYzZTBiclJSUVBubytvczJIK3NLVzVVRUV1WmtBZ1FJZ3BaRi9Vckh3?=
 =?utf-8?B?VDYzTnlMN3Q0WkVZNUVwS2dvZ2xqb254R0ZCNEY3bVhmT1BaVmV2QW1XYzlI?=
 =?utf-8?B?M2VkZWtDbEJiYWZBd1pTS1VaQTU1bytwcWpQcXNMb2Yxa3BhVkdyT3RoZGhp?=
 =?utf-8?B?a2dTa1VYeTNJUVR5dC9zTzlBaHV6dFZnQTVCNnVJcHE3b1RiK1k2eDA3dER1?=
 =?utf-8?B?ZzBtNkZvYmoxcWwxaWFndEUrU0l3SXVxcndIZXphdStwaUFQeGFtRmZBWkFN?=
 =?utf-8?B?U3VPdytWaHJjMEdab2ZFMmIyKzY2MVYvMWlMNDFFQTFGRmsrZ091dk9QV0pz?=
 =?utf-8?B?cmFWK0VySldPbW5WMnVSU3ozSklVcmN0akw2UkQ5SkJaVlNxT05XVFZWZ1hs?=
 =?utf-8?B?UzJYREVobGhVbVlpbk5YY29UK1Z5SUQrS2h6UDBkbGJ4MDJpcHdxZE50YUow?=
 =?utf-8?B?S3BodEZYeE9GWVpkZEtsNlY2UmpIWFM1RTZMY2Y2Wmp1eEhwaVBUV2MwVWVI?=
 =?utf-8?B?TGxUTU1TVmhtME0zSDR6MVRLNnNPYUV1bm8xU2w1RTlvQ1Y1M2x5U1VZdVhD?=
 =?utf-8?B?cXJYc2xCbWhSeGJ2Uk90TGQzVVloT1RTaFNHWTlqT2ZmbFR2UEVMVTAwdHdq?=
 =?utf-8?B?Q2wrUFdNczFMWk40bzFPRU1xVXl1MHdqYVRObEIwb3hQUFJtWU41bWJJeVor?=
 =?utf-8?B?VjV1b1VEdEJndXZURFc1OXFCc3RlYWZJRUxBTDZ5ZWU4V1JLN3hINUFHNGd1?=
 =?utf-8?B?Q1J3Zy9WNnVhNWlNb01NRkduVmpmWlgvdWVRalBJSkVjdFo5MSs4aTl6VEdw?=
 =?utf-8?B?NGZ4NStVM0hTcDl5L214Tm5jRHFEUkJ3Z09PT2U1NXd4K1dEc2lna1NMeVBy?=
 =?utf-8?B?Y3Qwa3RYRE5NelZyYkhNTEJiamdvR0M1K3lCeEM4cWR2b1lwV2lVNWszU3o3?=
 =?utf-8?B?N2dQekd5NmZMOHMxRDZpOFhaZ2YwQlRkamQ2WnNiajVtUkVtNTh1UlRiLzRr?=
 =?utf-8?B?cWw5YUxTZ1Y2azVHeHpocTdacUdTTG5rTGJ4WjV3U0FlVHpXZ2xLai82Vk1V?=
 =?utf-8?B?b25JZ3Baa3lvUlFybkNyK09XN3pIVnNJS1h1RzNKM29tbzFwTGtnaGZCV2Ru?=
 =?utf-8?B?eVNVdEo2TGFmSDR0bjhNTkpKc05oa0Y1U3NkUXRrL1AxM1lIUHk4dFdlTjZr?=
 =?utf-8?B?V3ZHa1Jza2E1b1BUdzZkSlNERFJFNG5acjQxK2EySjU3UFBIdEptWWVQWHEr?=
 =?utf-8?B?MFhSUHZjV3BMbjFXQkVPSGhrVmNBZHFCUkdrZVVZcnRuVGVHL2lET05maDUy?=
 =?utf-8?B?M013TVpTaFhzY1RUVVFLa0RTWlFxZXgzU3gvaHVDclMxN29tbmp2QTFuSmk2?=
 =?utf-8?B?YmZhMVQxYWROSDRBRjBJQzdVcThjaGVQOUw5RS9WajFuY2NBSXNHTlpJVjdp?=
 =?utf-8?B?cWcvdXMrSXNzdVpxY1FKbTljSXNMdDVBclZlL082dW5PUmxORkxrYi9YWFY4?=
 =?utf-8?B?ZHRJbHFEMVIzOStUaloyQlZ0OVoyR3dyMUJvejMwVmNBWHRySENWaitxRzYr?=
 =?utf-8?B?VHhFSzBlV0RuVk8zZzRoMk9hajEwUmxFQVAwVkZ4V2tSR2tLK0JscVE0RllV?=
 =?utf-8?B?czdHUnJOeWZsWWJXQXc1MTE3b25MMVE5MGNkZERLWEVBNEdUbC9vQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc03707-3f47-44d2-822a-08debcb58ffc
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 12:35:12.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHARPQcGTXVq6+z8owsUyAj0Y/fb1DAEP45nK6lOBXVifGZo1NahaJXVVLpmBL4g3U3inL5UfGvDm9HW9fC0nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2523

On Thu May 21, 2026 at 9:30 AM BST, Sasha Finkelstein wrote:
> The current approach of silently disabling all rust drivers if the
> toolchain is missing results in users that try to compile their own
> kernels getting a "successful" build and then being confused about where
> did their drivers go. In comparison, missing openssl results in a build
> failure, not a disappearance of everything that depends on it.
>=20
> This also means that allyesconfig will depend on rust, but since the
> rust experiment concluded with "rust is here to stay", i believe that
> allyesconfig should be building rust drivers too.
>=20
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2:
> - No longer a RFC, let's make it happen.
> - Update the docs.
> - Link to v1: https://patch.msgid.link/20260510-evolve-to-crab-v1-1-208df=
84e67be@chaosmail.tech
> ---
>  Documentation/rust/quick-start.rst | 6 +++---
>  init/Kconfig                       | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)

