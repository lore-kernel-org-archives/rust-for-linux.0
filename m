Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020113.outbound.protection.outlook.com [52.101.195.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D972DB7B9;
	Thu, 15 Oct 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072814; cv=fail; b=aFXtl2Nq3XvPFoJwA5rAgu1oREhYXMTUGfr2b5ZDyN+ZTEmMZTvxDxafo2sgSPRw0BTyeRXDsx4ogikgPuJ9qXLJFvmrAZO4PcBxWme2h5XzxT1/Cjv0UnuILJzaEd4Or5kqkxe0ooSoNncEbNtVR+XUGDmrsuTHGBXsOtmvojw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072814; c=relaxed/simple;
	bh=Yr6DoZm47VxBgsF/56qFnZELiRTYI40pKZlHfWrdxmw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WhXoj3HHbrmTwNEkT7onMIYsNSeNIzEZzaxw54DdQ32gP6/fqelK2jZsYZKXIGHFimMo/U0QwaL0iRkNo31X6ycr/f2IPVLPDil+RA2yRnR/W7l3jMKjqiP7oY+an7hqOXVWkpCBSQb2pZm7sFRboKmg2HpMNejAi9F5XrvhwmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pcYx/OvK; arc=fail smtp.client-ip=52.101.195.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pcYx/OvK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRiPhuBfhXr80IeLJjoieTHrnGXP2RVic0eRtbz2wMWSEcP+V2WGRuHhhYqaBY+lA1bCF2glO1Cch1lutY9Tmq+ut+ytA8IvfivX2ijORHFQuIA9Go7u7ov8nD0gPrmYAXKY6mTivar5NTDRG/qsZQfg27xcKgb34gbGbdWKmsOv7GBq8aEMKjOLdfKbjcHPeh0brB0Znax+lSSLVE4wJFkowXLa+9syN+8PKqDQJA9tuTYxSl6+BJvM6yEv7fQCUkiYcn68F2Nt90Wn8XF5BwqWUgKYlFTk3a/CBF4wc3ZbMUnjGak94OhKEPeYY48t2KXmG3CWW/puP0NHTIBUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW8/utau7KdQhe0zlbwBtFe5i/xLexTxH3SvwfUhYxs=;
 b=lXXXiFXsmsz0erg/XiDzooRjzJ6z5ijxZ3pMeaMg/TJ/BbGffhe471QEO9dPU9/a3jbZCSzTg8HoecRGgE/XVR7NFJ9rZvb5pkidKXsEJG8jWrgrGq/fU0p+G9MDAKy/naCBO3OEwaj4yIoBGNk/W3NQmfxXwERz+sranOW6O2VY301+f9rtf5uCj2OA+LMXdc2rSnSkWQpI3VZZ48mzpS6kAwKqCC4HdYFB5T31nHx6l/v+HKr11kztHQlgjizOz03Jh6q/NrDiIPpex6o+7Ik7oLP7bp3hwieetd+qmBR1aXhunAXHyqIPXkO1FK9dpoYkHVkMALLT6vu4/Iy7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW8/utau7KdQhe0zlbwBtFe5i/xLexTxH3SvwfUhYxs=;
 b=pcYx/OvKX8+2RN/m/wpqwWYM5N89SpVxTiYv+gBt4DIVLPTi8S86hvxq+hEySF3SPiSDyXloPTibMlPsa4NI3IGe+HlXiBKBX99bEfJDoxKvoFnrsSEP11sLkB+QQZGr65lxrCDm1xJzYGcSv2Xhd9V+urYV6SMCSU5HTGJ3UAE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6191.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:00:08 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 14:00:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 15:00:07 +0100
Message-Id: <DM5GSI7K9IE1.32TMUTLAR9WU7@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <lossin@kernel.org>,
 <lyude@redhat.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <peterz@infradead.org>,
 <mingo@redhat.com>, <will@kernel.org>, <longman@redhat.com>,
 <felipe_life@live.com>, <daniel@sedlak.dev>,
 <daniel.almeida@collabora.com>, <thomas.hellstrom@linux.intel.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 5/6] rust: ww_mutex: implement LockSet
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <cover.1791799751.git.work@onurozkan.dev>
 <8a3e94391fcee2b7e95a1f93a43c98ba385940c0.1791799752.git.work@onurozkan.dev> <DM2UEMVP195X.WA9QG4BY453P@garyguo.net> <20261015112611.60966-1-work@onurozkan.dev> <DM5E3B3DWY1O.1UB1GYG16T66V@garyguo.net> <20261015122618.145485-1-work@onurozkan.dev>
In-Reply-To: <20261015122618.145485-1-work@onurozkan.dev>
X-ClientProxiedBy: LO4P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 3398414a-959a-459a-4407-08df2ac49eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|10070799003|22082099003|18002099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VJipxKrA4iIMjHfqLroJI4IHeffgF7Y5mk36un52iO9IqvT1q8y9SRJnwufFm1SHwxllWqG3yotbfuVG3ebP272lOS2HR8ddi779JGzDpbUJQdd3uKQnyhGHs6EnmTgEn+Wz77cDcD7iISa7no2XxPeya5BQpibMbI0keqrIj1CN+0sGIw65aoBLo0H8gIvfQAIPaADqbZ1+nsb05B+OL+I3rJQPedzLa0JX6zelzy1q6qZx0BldP5W77RBIvCxbYlehvukBtbHSM1DLe6D8mJEh+PtW6H9/gLzajWqhZow66261VT9jw5w1QfTHvqR+8FTISasNhCXUdYd2UIoVmylwHCsb1F9Twvs2OGxHVAC7inVDBCCfZ/vtt+xHU5goMQrV2OyqmHL7ekB/uty4HDAV4vnfuAWlEVd+hmBUeRRbGv7x/fgf7alkWSfqLF4Y7gO5D+xZ/EFWdn6/1PBcR7M/BRHUGGIz3RGG6Whixupx57Y4MxcZ7Nce6jIlcR3JE6kKI3JSQSr7fbmXSL/m8ZRbrIhYZuZeInAxvdowcXPDshqsYFyYpIoa8ykDmZPbCzi12W6NwaR79azNMh1RrqXSLB5m5KLhJi5BJNBHOlfyF30A4sdRXYsknZA24HcrBvO4n8LT4AF3duja/qOI2ckue5Br87tqF9xgFnvdzSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME5jN2xHbzZGcGxWQWlQRzBGN3VvdDFxZUl1dE9yVXgvRGFib0xpcDlKRGI1?=
 =?utf-8?B?YUZkUWd0anVneWZWdGFhRmJtdEQ0ZWJNRUVHS3hXSjJvQUg4cEVrclptTEVU?=
 =?utf-8?B?Z3hCRVVQWE5ld0FwUEE5a2QwcDhWam5jdEdFMTZHUzQrQ3J0NHM3eXZFdUpy?=
 =?utf-8?B?T1doQnVaeDFTZTNlQU83YXJkbmQxK29VS2I0RmZnMENpRm1FTFhmKzFoWlZ3?=
 =?utf-8?B?b0Fkc3JRTjY3QUdvT0dWWGVhOGhCY2ZOMVdXVGdCYSs2SHlDS3hpcndUd3pB?=
 =?utf-8?B?M3lCNGxCUlUyb2tnZnAzcnYwUkNqMVJRaVNFOW11UXBpc0ZKbC96eXZmV1pS?=
 =?utf-8?B?SEZmU1hwMEY3clJ1QTZ2WWhlRVdtdnRsNndXOUlhejBuUjR2ZXluWW90ajdN?=
 =?utf-8?B?TzMzTEJ5b2FPSlhjNU80OTVjQ2NYc2lCV0VrZWVMVTR5YTc3VzVpUXQ0aUVL?=
 =?utf-8?B?a1p6Y0ttM0VUQnNyVUhQbVlYdzRabDJFbW9tcWNrK2JDdGhaMEZZT0Z6NEVs?=
 =?utf-8?B?YytqZFROTDVFdHdaYjR4cXBNbXN2eGZ2aW1pSFY1dHJ6c3lIb2toUmJxUkZX?=
 =?utf-8?B?RlhtRVZhc3Npa25MWGFrV09hSS9FOHo4bGU1NnVJRW5ZcGJGNVFYNTFjTVhQ?=
 =?utf-8?B?d3V6N2wvb1Y2VlJ6YTFSeWNoVkJHekNKNVdhaTVPQm0yZVFaTEI4QS9rTG1M?=
 =?utf-8?B?S050QmdUNWQ3UWVyL20yK0dNbWZ3dzZUNGVNZkQ2T1Y1R2x3ZlpqczQ3SXZ5?=
 =?utf-8?B?ZS94SGZIN0FTTVdacTh2UEZLMmU1MTZQUHRQMkYxR0JpVDRlOXByQSt3K1Zn?=
 =?utf-8?B?QmYvOWhETWcwUXRiVmJCL3FGaG1ZM0FrYU5uL0k3alRNV1VpT1JiRnBNa0VM?=
 =?utf-8?B?L1VWdEYxRDRtSk52TVl2YWw1dGxVdEwwYjNVTnlxWXNVb1hYOUthRTdURStl?=
 =?utf-8?B?ZVBld2JobnVJelFXRHB3MzgrRFVFKzNxTFlwR3FRN3lXMUMvRTNZa05oQmNL?=
 =?utf-8?B?c0t6UElPa2IrQVFxY3BnZVdFN1VPT21nb2VVRm1HVC9hWllaaU1tNGxHUUd4?=
 =?utf-8?B?S3o3RmpVa0RPYnVKVjN3eXpZSGtKMWNrU3ZvYUp2cXQ3OVkxbFRjTWJpd3dE?=
 =?utf-8?B?VGpjeU00aUpXaUxHOFZwRFA4RkJaWlVTNUsvR0VsTkVGMEhYSkQzWXJubHlt?=
 =?utf-8?B?ZlpROEplbU9LczFjbmlMaDdjRVhoS3EydVBLdjMyaHF1SUE4MzhWUVcvTjd5?=
 =?utf-8?B?Y20rQUFnV0QyNGhad1lrZmV1R1FNbnVobmFleks2Y1lKT3Y2aXJOaHVHKzVw?=
 =?utf-8?B?bjJJNTVXaUY3NExGRnhpVGl3NWd1OHQyZEdVaEo3ZUNCZFlmUHI1WkoxTXBt?=
 =?utf-8?B?am4wd1JEZ1haVlFMaVJNck1CbVdzTmtUOHN5amNMbEF6MTNpM0Q3RFN6Uzd4?=
 =?utf-8?B?MUYzQW0wK25ZQ0xmRkRNM1Jkd2twRGdkZE9UUkNXckd0Qm1DV2tjTTRLQ216?=
 =?utf-8?B?Ry9pTHBVeEFmeUZBUHVtTzMrM3ZRUGw1eG9YTndKMEp6MmlPMldVSVZKdk9i?=
 =?utf-8?B?eWJRM3V6cDk5R28zU3lvNHpMSEZBR3NiUEZ6OUlGczY3alNhdUtCU2EwQWpw?=
 =?utf-8?B?VzlxUHVMMUpTUnExMC9iOWZtNW1CRk1WTHJLSGl0NHBFYUhkbU9uNTR3WDZi?=
 =?utf-8?B?UkQrT0xMbUxMS3F4ekZiOUFsLzd3a3lCT1dEQitZaFVnamtWM3EvQk83MW50?=
 =?utf-8?B?Ni9iSWVXbTBJSDl0QjFoTVlSK1Y1ZE9ZQnNGYkRhbHNlUFlKTU5BTjBYOTdB?=
 =?utf-8?B?SzVXemhaNFV2SHFoL0tRdEJnRi9oa2REN2pOMk5PbUtHa05BQ3A3TU1zL0U0?=
 =?utf-8?B?NWlodHcrSFJiSlVpUkFsRXpITUovQVlwTHNRVEVUNWtWVUdHWm1DcjNtU1VH?=
 =?utf-8?B?SmtGWXNwUnB6MlBFT2o0ZC8yRUMrNnBjcUtKUFJNL2d2L2MxcDFVT3pSbnIr?=
 =?utf-8?B?bUJYWWlNZHBhdjZScTU0Z0s1MW9QQW1od0hmbkxWUWNUR01hUFZKSU9IaTdR?=
 =?utf-8?B?dXpwbXJsQXlHYzZVai9ndWFPWE1Qa0NISWpOVGVYMGNDWjJ1aXhUZ05Md1hr?=
 =?utf-8?B?YXAzTnRKZHAyYUZSQ0YyUlorMVB6N1gzeEpycTdSbnpObjBUODJUNjVUNDE3?=
 =?utf-8?B?ejFReTFxMnNwUEhHOGZZYm1OSXU5UGtvK3pncFBnc0FNcjU0S3o4azhoZjBD?=
 =?utf-8?B?MG9kTUs1L3RxU1RGMUdYV1l2dEhuNllGOG5iYVp1K2Q0K1dJcUl0MzM4UHRU?=
 =?utf-8?B?TVJvOHBGSE0rc2FMbVN2REtlajZwYmZOTmljRzNvbzdwek0ydWNqZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3398414a-959a-459a-4407-08df2ac49eb3
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:00:07.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MebuxRoomRZG6ApzVHJvXgbq3xzr/T/z+OjQ3BcsRgO/SHgF7lhyQv/yE+Aspfhb3A/FNUasd5VpxPKx6ZizEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6191

On Thu Oct 15, 2026 at 1:26 PM BST, Onur =C3=96zkan wrote:
> On Thu, 15 Oct 2026 12:53:10 +0100
> Gary Guo <gary@garyguo.net> wrote:
>
>> If you do not need the "acquire the contended lock first" behaviour, the=
n
>> there's no need for wrapper, even. Also, if this behaviour is truly univ=
ersal,
>> perhaps it should become part of `AcquireCtx`'s default behaviour instea=
d.
>
> We need that functionality for the DRM use-case, it's not something that =
should
> be applied to the ww mutex primitives but I would like to hear @Daniel's =
opinion
> on this.
>
> [snip]
>
> This still needs the contended-lock backoff when retrying the full transa=
ction.
> Simply restarting the callback can repeatedly hit EDEADLK, so the propose=
d code
> is not going to work.

WW mutex is fair so the transaction will progress eventually when it become=
s the
oldest transaction. I think acquring the contended lock first is basically =
just
a protection against pathological cases where say, old txn and new txn acqu=
ires
lock in opposite order, than new txn would have to wound repeatedly as old =
txn
make its way through..

But regardless I think this behaviour can just become a thin wrapper on
`AcquireCtx` like my earlier email. Something like

    #[pin_data]
    struct AcquireCtxBackoff<'a> {
        #[pin]
        ctx: AcquireCtx,
        // Set by `lock()` on `EDEADLK`; the mutex remains valid for `'a`.
        contended: Option<NonNull<bindings::ww_mutex>>,
        contend_acquired: bool,
    }

    impl<'a> AcquireCtxBackOff<'a> {
        fn lock(&mut self, m: &'a Mutex<T>) -> Result<MutexGuard<'_, T>> {
            if let Some(contended) =3D self.contended {
                if !self.contended_acquired {
                    lock contended
                }

                if m.as_ptr() =3D=3D contended.as_ptr() {
                    self.contended =3D None;
                    self.contended_acquired =3D false;
                    return a guard
                }
            }

            match ... {
                Ok(...) =3D> ...,
                Err(EDEADLK) =3D> {
                    if self.contended_acquired {
                        unlock contended
                    }
                    self.contended =3D Some(m.as_ptr());
                    Err(EDEADLK)?
                }
                Err(err) =3D> Err(err)?
            }
        }
    }

Then code that want backoff behaviour can just use this ctx.

Best,
Gary

