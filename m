Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020077.outbound.protection.outlook.com [52.101.196.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81011243969;
	Sun,  1 Mar 2026 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772377922; cv=fail; b=TeOQhvaEYh+57HdZahibvvxzNvtVwwWbhvtlYor3kAzKmQxQY837C41s0u1OZHEX53mUZ9n7/Sj836CuWs11YQQweWWguWGeboiVW52o5tkQwFyQZFeKeS3OZPasPfHxvw7OqQTXeMdeqMBBmBe9CFNB9uUUxL+ny5yRhAGFw7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772377922; c=relaxed/simple;
	bh=+5Lrhl0AuThb9l0RoaGpl+a+Te4MKFigfeJ4i5nueds=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FJQubs0qQoLDXKRCTtVV4v1SfEGARURo9c14lWnKpnPN0lw7MnmA2kSSDnAltN4jRPOklRLhHdSAv0zTr2LPFsBMP5wP3dqaOpkTKYWLjUqlWsdsjl2yXeOoZY3iw1kfDOro0KEkdSqiifqmESd0Is2z0J2Oh9XVjaRLErszmng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hUNQStEs; arc=fail smtp.client-ip=52.101.196.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hUNQStEs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSWT/NVvOzMq9hz36DpvRWyFjbvUGtyFr3AnxKBMgBMBPnG7eqTRwh56ZeHM8WXkNdgjVolP/I9sw0gk07nYNx5Ie3KcqJYbUB6uWadDtWZSq9JfKyHw+KLxNoldDUr4U3XIZLhLS551lFS0LV5RfM+XP94lGUk/1aX9f6fx5Ry28XEQ/ZRht07UxjZNNrZGg2UoFe2QPzk9q7QWJ6I8F/kHuOc/qT9qN/hSKy1ZeS/lZj0FGwILKCaXWU26t4Oro5AiKW7sDXGQvVZMc9j9Z53xcINASJk+YUpDIvxFNVMmA2uGiLSpEDaqowf0SSFLUtIAnsGbah0yTlbq+SVnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9ETzbldt8I3KD+i/nIP0jnc51zq6atLsbhhil4/Kf8=;
 b=caAg+r04IsSZWCGhWknxork9MOntDviHLuxT7gYKW8V3UVCIbpvv3pfz1+hT4BKPI5X9MuQ84mtGJ86XBlN24BA9JFUqc7s8g6QhCc8fPtJx6ggN5BYTvb1e380CHjCXjNiKqZnGRUO5BAZEGs/HH24xOrnFKDmDWgzSA4Z2m8WQcA1Ab+hNIG1AIhbJ/rZg1MPT45lH4GMr5INSLatDOMnelDAhy7kETzVgA2iJQphPkuyOa5CuR2DWhiq/O8yi8K3cbRiJKN35D+18GWB7WtZnMRak9n8PEzzpeZMblqFKit9nHImjempqaZxNuWESDriCLOeMH0bfFa4i6HgZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9ETzbldt8I3KD+i/nIP0jnc51zq6atLsbhhil4/Kf8=;
 b=hUNQStEsbKvTYWJI199pjmay85dHtG0F3S/34zJh/hlzsYzE3Ma10osRN7epSMRZzree6/Y1JdHRxfnEoqWzGvbn/JP/Kb11J78ubAM0iDJfy25vAWp80gK5bXieApkIFSmj7HsS7TJjmN15OYv1eUeJdaLiYzWou6DyyHNX+FU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6328.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 15:11:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 15:11:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 15:11:55 +0000
Message-Id: <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
In-Reply-To: <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f2bb2b-4d54-469d-90f9-08de77a4e0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	yZ4Rb7mQioE2158k/BTJZsFK9bw1pYgW9NOdmXNSZXb/vp2vpR7o0Yp0QPKYjixFry6EvBR4khPa4ZQFnXMLvyUdiq3KZNtrgSTj41J3oNoNV5Jdu7rtNAEDGoNwJeFlkF9DZWSdQoGVlofo+7y7hEKAn0WECNsuzdta+DuX+pGmpCC07YGjVRQKtl6xtNxY9EglytgfPKXCiHZ7yRbD/k1Pa4D5yP/6XqmBTF1SbO8cywh3/GBqRbL50eYIFPvH0bifHiUuSD7uDJ9g1g/bpkNEli76iQyzV5JRXSxHrkYdPyeSmA2s4jxqWdrFiWSmjv3bM+BGnRH9XV4TXD4KGRzo1oOXqkaClfdABZfvtMobkLpJNbGLXnUCY+X+mCSVFg/N0Lr5HxTPEu6Rzr17ZF8pAEG+wLA6ifj5rsp4aZLYdwLKsEeWsJD60GIvvFvHTy2wuDiO8kn0BvYqjb70sYBc3/eXAhe1DUfobhZGo7g9UNDUWzZUyj56N+fcF9J+yQCC7+0rY24GeiJDvjJhSH1I1apwtx02Il0jrAeVdgxl0mlCh9CvAcInrNHasHydgec6W1FGkqqUpCJqR7oAbvV/bFS+6WSjb9iST8PaoGj3wL4XcACIA62Xp/pTLir8JOoWoqK9lz1h/aUoJY2ScDH6oAqrh5Rm3w1MSZdy9NHkveeN64m9PXkHpl+k27sr73Jr+GKYvX11i/d1XbOMB86qDu98/RJ7vIEsVIl1bvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUdMT1pIQjdYWTNKK2doVG5kajVJWXFXVHo5QUh1OW5BOVFYOGx2YnJPRDJp?=
 =?utf-8?B?UW15a3FxaHVWUGphSk1EQ0Y2OExSYXZBR1BqV1IxeUlqWVpONXRRVzk4TlQw?=
 =?utf-8?B?QmtlUWswTGprc2Z0TGljTWhwZStjSENla21oOW9IUFhiUmpIWis2aGhXeXFL?=
 =?utf-8?B?SEpneDFWRC9KN3NkUnVDc1lDTG1DNVBjYlVwUmUwemlMclpyY1REWlR4dmtt?=
 =?utf-8?B?aU5WT01hejFDUFN2YnFkbmdvdHhKRUMwZTNaR29rOS9GT1A0YWpWL2xBS1NJ?=
 =?utf-8?B?WjlkN09vU0VBWWMyVmRrcEZ4MjVXZm1NdkplL29JNVFIT3l5Y1NKcUJHRith?=
 =?utf-8?B?Nm94WHZwQUs2RStkK3lpQ3R1Q0EyWFMwbGlxVVFrSDRDWGdUUk92Wm1Dc0l0?=
 =?utf-8?B?bXR2b05EMmhzTlU2UFZWU3J2RmtnWllxNFFrdVM1VklhcTllcWpPNW5ZOVlD?=
 =?utf-8?B?bXQ1K2FJa1U0M1o0TjJyYW9MaU4xTHlQN0huMjVtSFFXNHlFWWtQS2hMeGJR?=
 =?utf-8?B?UjVIZ3NSNGFZWWEzSE8yL3FXWDF1aVBSd05Yc3Z3QXBQNVc4eVBiSzQ3dTRT?=
 =?utf-8?B?R0NkQjJmOWpRVnNKdEFBV3pJWVQzODdQYnpjOS8zZjg2THZSUTFYdkJEZFRP?=
 =?utf-8?B?cGNhYTkyd2d0UmxTb1VvS3ErODlqekNGYVdJUUNqYW5QdG5OYUtvaWcza1p6?=
 =?utf-8?B?bm1wSU5RTTFkam1oaE1oT29MNEhJWHNGM2tIeDk4QlpvWGoxeUNLVGsrZTdM?=
 =?utf-8?B?NXhDbkJDUENERE1JdUlMTHRVYTlvMG5rKzJ5V3Z5VVhmWjU0TlY3eXVJcmdr?=
 =?utf-8?B?dzZoQUQ1TmpsaDZydHZJWjBhSEM3TTNTRmtQTklETk9iWlNMNFBUU2dTaXVK?=
 =?utf-8?B?dXpxQitpeVRJL2pmWkt0Vmc3bmhNNWJNTHJGbmVhaHhQQ0UrSmtia0dJbDN3?=
 =?utf-8?B?TU1TbzNHYy8yTkF5TEhrK0IyVXhjSDlrc1ozbU95RVdkcG5FNlUvUUZiS3Ns?=
 =?utf-8?B?b0FraVpZT3A2WS8wTEtvSytjU2ZXR2VPL2hkZHUvM044d1FZd2kwUC90T0ox?=
 =?utf-8?B?QUpabkppM3NPVDZsWTJjMzVsaSsxNlhVTTE1TUU0d1doZU1vMTFEaEJRYWk3?=
 =?utf-8?B?T2NIUEtQRU1VUkpPVDhvSEw5NXlwNE5XMkQ0bjh1TXIxR0U4WHpnQXlZMjF2?=
 =?utf-8?B?b0x0Z0toODFPemZQMTRBL3F3cUFFeUtxOWl0YzNyMC9vK3pIKzl3bUJLcDlo?=
 =?utf-8?B?MEt0bUdEa21Fa04wYlNOMitPbnJieEpEV1ZxZy9ycTZOOHpxK3RSVVRlY2t3?=
 =?utf-8?B?WTN6RzBBTWxiOUppYTBUenArSS83RHZJT2VMbjNNMTkvMVprNUFKVVdSeUlI?=
 =?utf-8?B?SGw4Z1JNRnRoelRPU3dOUWdJUHkyRERlb25vTi9XYXpsaFprcmY0dHliQVFp?=
 =?utf-8?B?TDZpdCtHQURwWXdRME5kbVg1MzZtYnRGekpLZWZEV1NlS3Y3MlN3SXcxbDk4?=
 =?utf-8?B?SXRDeHcyVE5zZFFHWmRQWkFOU0ZNZTlSK3RNVG1YRjZmb0E5S3pPZXJHbXkw?=
 =?utf-8?B?ejdYeEhER3lEWGtoZUFKWHZXd05ORVJ0OFhwOW4xVkp6R2tIL3ErZVpaR25J?=
 =?utf-8?B?dTRXS2JXVWNueFJnbGFOSUZzNjd6QUFMOXc0S2tyUERyNTRsV2Q2bmxGdVYv?=
 =?utf-8?B?Q0RDUHc2UkVxQzQ5d3AyTitpRjYxS1JxWDdkQTVsM0hjTXJWQ2hJTFVrTmkv?=
 =?utf-8?B?QWlrTzlkMHh6Um1EbkowbSsvVkdreUxHSFpjaUt0ZmZLVjFRV3l6K1hab1BS?=
 =?utf-8?B?cmlUcnpjUk4yZkFVRkhjaldYV3Rpdjd4MnhEL01iRGFRcncwR25Sb2VjTkhx?=
 =?utf-8?B?aHpHZndyRjczbnYrd09DbUZCRU1sa3F0ZFhOaHJoWVc2UWpsR05GK2R5a3Zt?=
 =?utf-8?B?bGh2SCttTmJ5Y1U5NUM5RmtGVStLZ3FFQ1dYR0dOS0o3a0FGd0szNUVremdq?=
 =?utf-8?B?RjdUMzVHSmlCcTV2U1I0Z0VlTmFKbjJBS1pZZVJHNkQ1eDdPZ3YveG9uOWtQ?=
 =?utf-8?B?bC9INDFqdHVWc2NaZVJ1T2xHU0ZIRldEdElENVRKZ1NXNG1mNmJBM3BORGdt?=
 =?utf-8?B?cUZlcmhPTVhsSnlLWHQvVlh0SVRqRUoxdlVQWnVPREFjZG5uNWJYclpCaVRI?=
 =?utf-8?B?RXVDU01ON0NCRGl0U2xIcmpVRlh2ZmhYNk1ReE85MWpZVHRvOUQyeU5zUVd4?=
 =?utf-8?B?d25oYThxNnpnN0hOajBHKzVSZjArT0xpOEY4TGZ0UWkwZ0hwUHhWV3ZnNzdx?=
 =?utf-8?B?WXljZnlGekNqQjJCTW5sS2RrSnNjb1hYcHdKVjFzT3Y2c0ZtUmhEZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f2bb2b-4d54-469d-90f9-08de77a4e0d9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 15:11:56.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPoC7pKIVtz4VLtraLtfGKfFsjVahoUdwM3i/WO0p9OliDESukAq33lLxlSkimSbiiaPk4zwHmI8UXFhOR+joA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6328

On Sat Feb 28, 2026 at 12:33 AM GMT, Alexandre Courbot wrote:
> On Sat Feb 28, 2026 at 3:02 AM JST, Gary Guo wrote:
> <snip>
>>> +/// A pending I/O write operation, bundling a value with the [`IoLoc`]=
 it should be written to.
>>> +///
>>> +/// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`], =
[`IoLoc::init`], or
>>> +/// [`IoLoc::init_default`], and consumed by [`Io::write`] or [`Io::tr=
y_write`] to perform the
>>> +/// actual write.
>>> +///
>>> +/// The value can be modified before writing using [`IoWrite::update`]=
 or [`IoWrite::try_update`],
>>> +/// enabling a builder pattern:
>>> +///
>>> +/// ```ignore
>>> +/// io.write(REGISTER.init(|v| v.with_field(x)));
>>> +/// ```
>>
>> Thinking about this again, I think we might still want to write
>>
>>     io.write(REGISTER, value)
>
> This was the original design, but as you point out below this makes the
> very common case of writing a register value built from scratch more
> verbose than it needs. Real-world examples are significantly worse, e.g:
>
>     bar.write(
>     regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
>         .try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?,
>     );

My main dissatisfaction with this is with the function call

I wonder if we can just have

    io.write(loc, value)
    io.write_with(loc, updater)

where the latter simply is a function that does

    io.write(loc, updater(T::zeroed()))

then the example would be

    bar.write_with(
        regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(),
        |r| r.try_with_offs(load_offsets.dst_start + pos)
    )

[ Note: it's possible to have write_with that works with both fallible and
non-fallible callbacks. You can define a trait like a monad (well, not full=
y
a monad, because this just has a map, not a return and a bind):

trait Map<T> {
    type Mapped<U>;
   =20
    fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U>;
}

impl<T> Map<T> for T {
    type Mapped<U> =3D U;
   =20
    fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U> {
        f(self)
    }
}

impl<T, E> Map<T> for Result<T, E> {
    type Mapped<U> =3D Result<U, E>;
   =20
    fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U> {
        Ok(f(self?))
    }
}

impl Io {   =20
    fn write_with<R: IoLoc<T>, U: Map<T>, T: Zeroable, F: FnOnce(T) -> U>(&=
self, loc: R, f: F) -> U::Mapped<()> {
        f(T::zeroed).map(|x| self.write(loc, x))
    }
}

then this returns `()` if closure cannot fail, and returns `Result<()>` if =
it
fails).

end of note ]

BTW, I am also not very happy with the `::<E>()` syntax. I think with the I=
/O
projection upcoming, we might be able to get rid of relative offseting
completely by requiring user to first project into `View<'_, .., FalconBase=
>` and then have
some registers that can only be used on `Io<Type =3D FalconBase>` but nothi=
ng else.

Best,
Gary

>
> turns into
>
>     bar.write(
>         regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(),
>         regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
>             .try_with_offs(load_offsets.dst_start + pos)?,
>     );
>
>>
>> Granted, this does mean that we will write `REGISTER` twice in some case=
s:
>>
>>     io.write(REGISTER, REGISTER::default().with_field(foo));
>>
>> But, we have no redundancy for the update case:
>>
>>     io.update(REGISTER, |v| v.with_field(foo));
>
> In nova-core, `update` is less common than writing a register value
> built from scratch. That's really the only thing that holds us from
> two arguments in `write`.
>
>>
>> The reason for this thought is that conceptually, the type of a register=
 is not
>> necessarily coupled with the register itself. This is the case currently=
 for
>> register arrays, but also the case when we think in the long term where
>
> For these cases I was thinking we could rely on From/Into
> implementations, as it gives us the option to make the conversion
> explicit and thus less error-prone.
>
>> bitfields become decoupled from `register!`. People also might just want=
 to
>> define a register of u32 without any bitfields at all, and in this case =
writing
>>
>>     io.write(REGISTER, u32_value)
>>
>> looks nicer than
>>
>>     io.write(REGISTER.set(u32_value))
>>
>> Spelling out the "offset" explictly, arguably, is also more natural for =
a C
>> programmer, and also simpler on the implementation side (all the helper =
methods
>> on `IoLoc` would go away).
>
> That's true that it would be less `(try_)init` and friends helpers
> (`IoWrite` would also go away I guess?). I'm not a huge fan of these
> because they only cover specific initial values (zeroed() and
> default()).
>
> Maybe we can macro our way out of it?
>
> It would look a little bit weird to resort to a macro just for the write
> case, but I don't think we will be able to work around this without any
> kind of compromise. FWIW, I think the single-argument `write` is a
> reasonable one that might look a bit surprising at first encounter, but
> has the benefit of reading naturally.

