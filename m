Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022134.outbound.protection.outlook.com [52.101.96.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE71046C4C5;
	Thu, 15 Oct 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065198; cv=fail; b=nTPj3bGdOJT3RBWEkhtRITchhWORSF4ghmGBgRwOo+cwqcS7NeKQcrJImFuMuU48LacEtzMJiaTR6ub0b/VTas2eWjGruHnTrpfJHFtG4JpHOpWMadpG70/j5FpwKzn1GxlvkUHKtQ+YrVgppvHbbjhjvqD5wlNbDpYYVmhX/kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065198; c=relaxed/simple;
	bh=uy85SaJ9vNz9lIpEJVafI3Jv1i1ypmj0txcIf/3CUUI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ctXfFZ6Q8TW018E4hoqYjKAd+sOFkXHhKvrXQVDM9oXVqabbJaUmsn2/7ZCfami951wn0tkdptwWfdOSxc3lCNJYu3wfHrdTRlR92VKmQsffPT4ewkDfgdJLII2lK1y5k93iwLp0zlaPcDiMmDfTTixmSQfhOyN8OnWOFJgg0o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nlZfcbKa; arc=fail smtp.client-ip=52.101.96.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nlZfcbKa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N84j+TPsiN1LYIa9skW+jpBQAMrN7/yYk+fu0VLwnhtM+TamKjLavOIDZvQWUkWF8pM2cVO24zfrPDvdnrQnS3FDZkphvFSw7KtdVYCFsvwBDuFDV1c0eWkSR5gyn8Xcwq++nw810ug6aKu9y0rxmDKf6vR3SQmSoRhuBsZzdoirTN2PEfxbATgmB8jGvv0SebuN4L4s5tMvFZ047Wg2b/ilnGpVUWStMpZ3WPnxMiDKpE8gMDHMRF8y7dKKz+PUkn6uEEROs2Y2ip7/B5iAXPSbTSSK2FfLiZCUFYunvjCXcLHgiGQt9290wkKZrjy0SC2dlazqVF6rb0qh0JBHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yADcM4UiXR5ahGxoraPD1jwrOU4wD9cMw91bCfgIEpc=;
 b=S0VVF9vH1StdibDezb/xZ8jY1tdcrwAy/s/NK4VGTpUyrXEFDN74mMviyztzmFeqPfQcfXxi9RU+Zc38EdVpiAxgRXEF62nLPBQ2cM9ZZQjHZOxMkJRYpNjVCbNLtqFIQda8Er3CbYehIbN/yQko2S8IO2kwTtGPyTLqtQxD8hb0DUSUWb8Wr5/bXTie+lCTQt9lgQzNCBVB9jWhTU9Nulm2Li1cJjdLsbtfSqAV0VV7AU7fpY/ZgTpBrJ+WQEjBE0ltS4IzODR20i2Zt8wN171aohzt38bmIJ6+LUNPWDxCRfaOmw81VcrJA0EHirwTxpnrjcA+RrQRdnSOeNWfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yADcM4UiXR5ahGxoraPD1jwrOU4wD9cMw91bCfgIEpc=;
 b=nlZfcbKa0pcxeWW/3tHWGXRmjjmHSTI7bIx2HpNcCoQxOaTFblnA2IAMjVkZLEYbs/sksY73xM/NFoEbFEzirUd7ce8SxHslSGPUX/qIOlix5DYZKJRA9z624iWPlQBe6S8NqGl187jqGpZDMXMr+viKu6C9+IcCYWDVYK4dBoQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB3241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 11:53:11 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 11:53:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 12:53:10 +0100
Message-Id: <DM5E3B3DWY1O.1UB1GYG16T66V@garyguo.net>
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
 <8a3e94391fcee2b7e95a1f93a43c98ba385940c0.1791799752.git.work@onurozkan.dev> <DM2UEMVP195X.WA9QG4BY453P@garyguo.net> <20261015112611.60966-1-work@onurozkan.dev>
In-Reply-To: <20261015112611.60966-1-work@onurozkan.dev>
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB3241:EE_
X-MS-Office365-Filtering-Correlation-Id: e1853752-4986-4a5a-e237-08df2ab2e2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|10070799003|366016|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tPRfALxFgsrmp9TXzMxrF/ZEaFYO5yz5/LBaY3JdaPAYnztKNwF85yVbYiMB+9rkQH7QYqtsBZZhDL4MWZWYVPzANY8cLuVSVovFvKiz7xa+L+Uz+RRWmZxaY2GXLRvZIpSk/oKs9poCRIhwViG9oBlRx/hXVsAjZiCCO4JBxMJ2ycvRXBh+RAugwjdWkRLOPOCH4cDa6Qp0eea+VeYzs5B4wDXqzcPBSjbRAOft5ze9+9usX6PvU/bSoSJmBAwJ1MD8mjtoDOrI1h/krKLYfxNiLBg8IwaQ/A2nZI+h0m8cmaUC23D+quLW68vXBYnUMkl7LdJHsfrzOQzwHpODDDTrGAO3k8WwAkzGQ2jVAEi88Jy8xybVClUVgDlNYJERUA7umUUutGbkdTzbYi6n7EvpK0ovAZVuMNGItsAGWSMg4WMJcyPfmN+nyGnSyvOhQuzTqgj7+A4/GX/sj7SgA83PqjVEnKphihjGLyU7W6h6wD0E7qFWPYZuhCZswbWlWUkYIaCEopKku5B2XCYpMf7h/E/ZaCLdAta4ErvQGLj3U0MQuzAehgt5FPvfzP1nsBQSEncq6CgyH15xV/35XXtaOyz0QX8xN0qxeMIKbyShow4uEcIL2+qCy+ZwXJ0FxqF2yeK9MJ+L6X3CDdU8Ab2Fr20IA4XBoXZkItrDhdE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(10070799003)(366016)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OSt2TFh1Q2QvOGtaNEhvaTFEcWF2WkNta3k1R1FYTU9uMU9wYXJkbmNHRjhG?=
 =?utf-8?B?cW1PdmF5b3k1bFltclgyUlZxWVMwdTJnUGlqUjF2c1p3aVBXb3BmMEdqVHNa?=
 =?utf-8?B?V215V2svSnFmOCtTeUcyNG1NUFphK3ZoWUw2Y3BjTGlaOGxRNWJXdHNXNExl?=
 =?utf-8?B?K2ZMRlZTWFNxZ1czbVVud2hqNjFXZThEOHpGQ2RWUDVTTmIwZmljS1R0UW9O?=
 =?utf-8?B?dmR6dUxrWDRKS2lZaUZyb1lNQXE0L2FXNjlNRkxYNVF5bEYwYzVYTlBlWWpx?=
 =?utf-8?B?VlV2aDJQVTF6c1dZRWpwUHlvQndjeWZ2cTFRSUY5UTJkNWtwbHlPVjVMOGN2?=
 =?utf-8?B?NWM1aDRJNkgwY1RZWjNBczV5QXJ5NDR2dXlpaGlhVTRXYzBBeWxlRmVyK2NT?=
 =?utf-8?B?WHQzSTdWUGlWOG5BY21sMjZhWmFIdXdISzgxSlE1N1NjaWNUdHZqRXl3dk1x?=
 =?utf-8?B?dm9uSUZKNjljLzBNZjNmS3FxYzJIUjhTTlkycW1jaHRKSi9mS253SUlSK3Ri?=
 =?utf-8?B?M0kzNzJOY3N2d2tqSEZmaERZSzhKWUhyc3ZMSDFMYnRlaGExaWtJVU5EbGZz?=
 =?utf-8?B?ajlKZlF4cWNEL1VOTDRIb1YwT2pxUU11c2dNclNmdERGUGR2OXRtNms5cXFs?=
 =?utf-8?B?Z2ltOFBYNEFzbWpsRW1HcHZBSWxkNXUwQzZzMXBNTjJrOUVMNFdjMzlUU0dw?=
 =?utf-8?B?NW5oWFJFeVNpM2hWaGxXR3hkWEdEZ1RjU1psTzRUT0FxYnl6U1VkUVFXRyta?=
 =?utf-8?B?OWNsZEhxbHY5TjgyeUlNV0JSQnZDT3cvQzB2Mk16cUR6Tkl0RnBCT3gweHZi?=
 =?utf-8?B?UWVZMS9JNlB5YlRxRmExSnFuZCtMN0lJZkpPNit0MkNLU3lsOTc4R1N4NGVM?=
 =?utf-8?B?N29LMVpxVmNlaDMyNmcwcmMzNU9WZGZvemVTTGo2U1lTRVFyNU9wN2p5aTY5?=
 =?utf-8?B?YWFKdEo5MkdtMEIwTzAzb2ZZN3BSRkxWZEhNV1RRRzlRSmtFMnAvZVB4TVZR?=
 =?utf-8?B?b010OUZlZ3NqMStvOVFQakZHV2RiNVEwZllrSmZKbWM4MXdzUWx0QjlqTmFM?=
 =?utf-8?B?eVdMVE50SEpWamk4ZkZQdEpWN0R6NkhGaHpBaWtNS2pEVDVsUGgzR2VCMnBx?=
 =?utf-8?B?ZUs5RlVERm05eG90K3VLYmtKaGlSNExDSFlod2RRSzZFNFBlbDBJN1pvV0s2?=
 =?utf-8?B?YXh3YnpGV1gzSzV3bHg4YmNGSnVSWXo1ek9YUzZTbzllWXVjRnArNVhsOHdN?=
 =?utf-8?B?MWVzYk1MYWM5blF6R0FpUjh5STF4aXJlSlo0OGJDN1BOUm5jQkw5K3BSR1kv?=
 =?utf-8?B?SDlqNTlHazRlU1JlL1lJWFhXWXVJSXQzSHFWZ2IrbzhsYmYzNzhDcXlSQmJy?=
 =?utf-8?B?ODUyeTRqdXo4VG52S3BWY3M5NStsV2dMbEIzSkNZYy9mU21DN1pKNlZCWENG?=
 =?utf-8?B?dy9rRlNWcExSSVFUcDUxVFdXQXR3MEtWR0MxWE00R0kxMlJGR3lrcUpleUNy?=
 =?utf-8?B?YnRGY0JDRVRBVzJPRW45U3NqZ1ltamxnVnNieGlxcnptVmRDSHZobEJQbEpJ?=
 =?utf-8?B?bEpmUmoyRSs0bVd0eDByLzlNK2FDZVpaa1kyL0F0ekZUQnhkYWhlMzY4ZExJ?=
 =?utf-8?B?QThBS0hZVjR3eWpCck9IeENtTWR0Qlh1QmtQS2o2d0ZPZW5uS1I0SjhCa3Js?=
 =?utf-8?B?QXpBVG9sTFF6N1U4MzNmM3RSdFVoWFg5TllEaWtWdkU2SmFmT0RVRHliN0cx?=
 =?utf-8?B?bXBlMEE4d2xMeGZ4ejNNdUd1VFBHMm1LeDNTSFQzNVNEWmRzOEEzT0gzMGpx?=
 =?utf-8?B?OWNHNDZCbWNGWi83eFp5em4zLytQMTJXM2NERllhY3dNQ0t1MHBEbkVGK1g1?=
 =?utf-8?B?RkVBTFVKcm1CUWdJY3Z5bVkrVm5Hd1ZFQXNWbzFHeGUvYUhzbVJ4NTFRVmxj?=
 =?utf-8?B?OVVZQ3Z1c0NaYmJDU05DVU11cm1odXo5QUtweHdYVkt1cm9DWEQycFNTN2dB?=
 =?utf-8?B?WFp0cEdxMnhzc1kyelo3eVEvUC92S202SmFNMDNRS3I4dFU5WmxPUXVuLzY2?=
 =?utf-8?B?S29wWVcxajJUK1lmN1hRRU53OVVCcmxOWWJ0RllKcDRYOEs3L2xpeDN5ZGpk?=
 =?utf-8?B?clFpUlpCWXhoMGxCOENQalcxUmdDRXV2U29Fa0xlYTNwWFErNFZaMUx0VGNN?=
 =?utf-8?B?ck03ci9zNTFtTEQ4emhhc1BRRFY5R2dsaUQ3bW56TE8vUVFuMmxBMmg0SUJs?=
 =?utf-8?B?VGdGVFQwaUEwbEJQcnRFUjJjSklZejJHbk9RYkxJNFQxd0xhSE4rMkdXWDYv?=
 =?utf-8?B?amVDS1FTTVFGU01Pd3JhVjM5SXVqWGlET2x2bXJXNVQzdjlMUjZNQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e1853752-4986-4a5a-e237-08df2ab2e2d1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 11:53:10.9094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrf+O/DzKANP87Smfv2NyFk/9azEoNKt+CnjKN48iFe66oFXlALpuptOhZyUn4+zbYLy7DKa3AsOjiKd0/b8Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3241

On Thu Oct 15, 2026 at 12:26 PM BST, Onur =C3=96zkan wrote:
> On Mon, 12 Oct 2026 13:02:15 +0100
> Gary Guo <gary@garyguo.net> wrote:
>
>> On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:
>> > LockSet is a high-level and safe API built on top of
>> > ww_mutex which provides a safe and easy to use API
>> > while keeping the ww_mutex semantics.
>> >
>> > When EDEADLK is hit it drops all held locks and waits for the
>> > contended mutex. It then retries the given (by the user)
>> > locking algorithm with that mutex held and the same acquire
>> > context until it succeeds.
>>=20
>> Do we really need this, or this can be achieved by simple retry loops?
>>=20
>>     fn retry_if_deadlock<R>(f: impl FnOnce() -> Result<R>) -> Result<R> =
{
>>         loop {
>>             match f() {
>>                 Err(EDEADLK) =3D> (),
>>                 e =3D> return e,
>>             }
>>         }
>>     }
>>=20
>>     stack_pin_init!(let acq_ctx =3D AcquireCtx::new(&class));
>>     retry_if_deadlock(|| {
>>         let mut gaurd1 =3D acq_ctx.lock(&mutex1)?;
>>         let mut guard2 =3D acq_ctx.lock(&mutex2)?;
>>=20
>>         acq_ctx.done();
>>=20
>>         *guard1 +=3D 1;
>>         *guard2 +=3D 1;
>>     });
>>=20
>> I think the only difference is that the `LockSet` acquires the contendin=
g mutex
>> first. However, I imagine we can solve this by having a wrapped `Acquire=
Ctx`
>> that provides that.
>
> That's what LockSet already is. How would you design that wrapped Acquire=
Ctx and
> what would we gain by replacing LockSet with another wrapper?

The LockSet API have multiple issues that I consider problematic:

* It always allocate, even if you don't need a dynamic set.

* Accessing data searches through the vec. To access all data, you will hav=
e
  O(n^2) complexity spent just on vec traversal.
=20
* There's no way of getting multiple mutable borrow of the distinct locks.

My example above has none of the issue.

If you do not need the "acquire the contended lock first" behaviour, then
there's no need for wrapper, even. Also, if this behaviour is truly univers=
al,
perhaps it should become part of `AcquireCtx`'s default behaviour instead.

>
> You need to remember the contended mutex, release all acquired locks befo=
re
> waiting for it and retry with that mutex held and the same acquire contex=
t.=20

My example above doesn't have these issues. Releasing acquired locks if fre=
e
with `?`. Retrying is done by the helper function and not handled by user.
Acquire context if really easy to be misued, can be done by the helper func=
tion
too:
=20
    fn ww_transaction<R>(
        class: &Class, f: impl FnOnce(&AcquireCtx) -> Result<R>
    ) -> Result<R> {
        stack_pin_init!(let acq_ctx =3D AcquireCtx::new(&class));
        loop {
            match f(&acq_Ctx) {
                Err(EDEADLK) =3D> (),
                e =3D> return e,
            }
        }
    }

    ww_transaction(&class, |acq_ctx| {
        let mut guard1 =3D acq_ctx.lock(&mutex1)?;
        let mut guard2 =3D acq_ctx.lock(&mutex2)?;

        acq_ctx.done();

        *guard1 +=3D 1;
        *guard2 +=3D 1;
    })


> Also for a dynamic set, you also need to keep the acquired locks held acr=
oss loop
> iterations and helper calls and handle repeated objects. With ordinary gu=
ards,
> that bookkeeping falls on the caller unless the wrapper handles it. LockS=
et
> already does all this.

You can make dynamic lock set just a data structure and not do everything a=
t
once, something like:

    ww_transaction(&class, |acq_ctx| {
        let dynset =3D DynLockSet::new()?;

        // Check if already inside the set, if not, lock it.
        dynset.lock(acq_ctx, &mutex1)?;
        dynset.lock(acq_ctx, &mutex2)?;

        acq_ctx.done();

        dynset.with_locked(&mutex1, |guard1| *guard1 +=3D 1)?;
        dynset.with_locked(&mutex2, |guard2| *guard2 +=3D 1)?;
    })

Best,
Gary
