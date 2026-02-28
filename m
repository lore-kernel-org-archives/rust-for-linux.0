Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011017.outbound.protection.outlook.com [40.93.194.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC91D88A4;
	Sat, 28 Feb 2026 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772238791; cv=fail; b=JQK/rha52ZurrIlESKPYIW6hMELRX2v/Jhnsxh2w09WkA1V8MldSUukNX2dljyH3ZnQpTN+kn0UubsKZ+0N0FVBMitCskjIkhkPey5vlgawxOh60pWtNxMOurb73dA+6XMUWsOcAOv7WhiZrgI8ar4cUyU7MlFgtNf3MKZM8fsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772238791; c=relaxed/simple;
	bh=qYJYc+Nw42PWPi5HZbo7dW4UUfM1WhQkipai+86Pqs0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=tRqSoLD39YulDlyABci3WmMEA3JdJFB0rmONlpdqJEQNqYr6IPOpg4d/V5bNxw6gkVgSmf1uX+8koVJa0aUVPzokOCZGIGCRr4LIxquhtM4mislf7BhX5x5q/p6vdXKJsnlOFsBmdhmPzZO29l70Nhya7+dgDi9iHFP4VRv/+LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mDShq34t; arc=fail smtp.client-ip=40.93.194.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mDShq34t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLnkyIx6zdeG25jlFbNTMa63bpkuxXjUB5CTtraxAdEPI9QFEKHDlUC7oy56k86s5T0u7GyOAbgL5tKlmdok3cdszCetBU5hsZhvsb0YByJiEDrRULokaxqQqR1d7+5Ke7RgmFW435YXOwfzhaNAZLUMma7nU7atpYTm8/WizYkb7MX9t4tV1fOxPmOqWBCXxobnwgUMDBMXaPzzVsa9FzVChfUJ8D5c3ezYQxFDaW+K900mnnkc2ljWD25T024nD07vHQ64JZ4K3RtKOllOE2bJmuaJZjwUQuXQmxOyZJXABKB+upyPZNc9+B5HLxII/DF5s5AzWAXrvH23fBvVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6Eqv+StuRVRwFQLQTZvghh/bGRJfqkZhN/80T8Ui18=;
 b=tKRZ3C0mEPCQwP0MD6CCgEbFenjJlSjZH0fddTWpd95ZyYXOibxoL1aib1rKSQrUKd5zY1PyhqtT+/TJ67TgsGhpyL8KmD7l+c4RFQ33R75ZGNp+AZ2b8LCZoJ24EnkuY3MedbJMe+jFzwwVeLgTyxM3776CJ++C+IzjJHeVpFpK1Hw3sLzLINTOI3rIHeTsGfOEWEZ/9n84bQJRuTVs2WRQO3qqD0FM28k5ygBH7ueTWEZP30owCbvimDqzc5ndTs0FNBPqITaIyZHtByO1+clYLydaFs93z705dygOn68f6p1lsigNXKl3gEKIyXYVbmlstIEO8G0KB2UGoXByzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Eqv+StuRVRwFQLQTZvghh/bGRJfqkZhN/80T8Ui18=;
 b=mDShq34tIH4V8NDwcKu6nUoz+SqLNI+YdC1uWdDcgxgTuyJlihugfrkT6S9UleVUHrEKHYVcv6FCkebMjkh3MPSC8/+2EMOlUHNtvO2lbSSCnoo2PmQa+QGRETk3jFVWSooEQeD/OOpN1996A/rwAgwddy6MQLsDOoxDbKX0ZDrd4eZ5HhWIuenTqwJbTdfivnJTWqDfnDucd04l7ryf1ShImgOXT1XiA+0wNjZLnsvWwYxOW1z2jog7LHD4vABKNTVcqsdSKw+By7X7oO+mgyvA0skjd/TC5uxXeskwiIVwE+ao2D6RZqNftlmBsqgHcR/9MvpHtmBRz25qZPlkKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPF2FA070BDF.namprd12.prod.outlook.com (2603:10b6:f:fc00::649) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 28 Feb
 2026 00:33:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 00:33:04 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 09:33:00 +0900
Message-Id: <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
Content-Transfer-Encoding: quoted-printable
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
In-Reply-To: <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
X-ClientProxiedBy: TY4P286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPF2FA070BDF:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b9604c-fafa-40cc-6cff-08de7660ef6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	mSCE04E2uBGIljaX6Lw9k7T1qmGvINNp4T5XnLj15ikX08DfEO8xE/Srv2Ov1ZtFDP3TEYwWTkD3D92Q0aqsITi/xT6cEnbrlCumo6BnHjb8BG72yYiDVW91oYAb8c17no9SpM/xEDxr/HQ8/8bp6v8roQFc+klRQK4f3rrs45om6PrBXdyw6azkPja+0Z3bNf8Vf1SewwjRRPg/dKu0o94lMpW9Z/2m/8N6s+ic1t96b1E0xSWrUBFtpqbRmg1ZG519QiEHH5yLVW4YG/3i+/HHhL7nSatw5cwPpqDvPKV6mgcz0UjmogG97WwFuBreDcyWnLvid/R2C8ebRlrFuN5MvwaVI6UqymFsChvxntrwaGFB4whFqUyEcCKift/QyZo+ynRcEIXnvQwvVU4bPx5S7O0aEZfGvUviyYHZKD1GuMhYdSR/uKlhPpdR0hBtymls+q+2ay2UWSJEaaYU9273xzGxpmp3vcjd1638j7MaOtfGjJn0t0rEeQWOUMJzIjnUY/nS1hJ3bBu4uT9bstuDoNk3OUGdNe80sa/4X04xsodXwhvUaoIycT2Zu+CnD56bb0aR3Sk3JiviasfC/puO6LCa/QCws8fCG8bNivZEfCKmcvyV8GsgwpB8eFO0Cfz077Ft1FPTteufkdyn5/4F5JKdd8aE7d3qEksw7NlpIO78kWChfI3tx0oJDsnb/GlYI8+tPOktzbXBZtZlfZ111VYc7tOM2dvtSsuR/F0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzFXUitWZ212L2tOcStIVEw3L3dOT25MQzg1eW1KZVVJYlU4ZlBEcEtIUTkz?=
 =?utf-8?B?c1c2OUVoYzNocHRQOWZTRFptcWtXZUNEU2xzVmh2d2R3dGhWRngvZzJ6VUlo?=
 =?utf-8?B?NVVjVGNYRCtTNkxHU3NQRXE5cGxYUE1GbDJIcnU2RXJkbmhTZmNRYWlyV0ZQ?=
 =?utf-8?B?WVRYblVUUmxqaEFUUnpwSktHTnArQStmZ0R3K3VueHBEU2VyVVhRVmNVV3dS?=
 =?utf-8?B?SEVJaUpTNmRWdDRLVGhhT1VzejU2Yk9QeXRuanVHVFFMaE4yRVo5dUV3L05X?=
 =?utf-8?B?OC80U1VGTTBIeWMxVVRHMGd3SG5kbm5NUjVCZFZwbWtDd29pSGpvdHRVNCtr?=
 =?utf-8?B?dVZQaTJCSE5mSHhFblBHRyszZloxNGlBaFNET1l3TUkyNDA0R0lhL0pCTWE3?=
 =?utf-8?B?a1Y4ZEoxRGdkWTBtOFhSZU93bmthUFFkVitzejIvY3Z6enpxSVVOdkQ3TzlH?=
 =?utf-8?B?bmtaSHVBbjhpWG5LTVFKMXg2bi9lU3pOVzhsR2dDMllFSmF6aEt0MjdDWDlw?=
 =?utf-8?B?UjRmNm04endSeHdBTStBYUVESVd6enl6cFIyV2NnRUVkZmx5RHYwQkxzUjhG?=
 =?utf-8?B?RElySG1zdWRUdk9aMnNhc0FCcHhQRWZ2VnBMc1UrQkNjTEtQcVVBN2ZhN0pm?=
 =?utf-8?B?UERIWHUvUWp2bmp2a0w1Nm1Dd3pHMUJ4WXRWdEpBQ1hjZ0JnYW1pUjduMkNG?=
 =?utf-8?B?Ly9UZWV4Nmlua041RHBkMUE5NEgrYm5lVnd3MnhVN1ZKUDZUOUg4VjJTSWNT?=
 =?utf-8?B?UG5UWkhCRmJiUHcwbkZHUGErdTdDbThCNEw1VXpyNVdCYVFsdytKNUtQR05y?=
 =?utf-8?B?YTF1KzhGZlV3RFExM2lpMTBPWFo1cWZpQmxpZi9NdEhzUmhKNXhhSDdQUjYv?=
 =?utf-8?B?bXZMOUpackNYdnZnRys0d01od0ZhNktqVkVSeFhVZWY2MnhWcTZVRURqUkJq?=
 =?utf-8?B?d3Z3K3dyYUFuSFljbEdWS3Bhc3JWZXRWYzd2UFAySlBnU2IvSDg0djRCL3lz?=
 =?utf-8?B?TEJ4dG4zMUVCZGVoYkQwcnlLQ3hvemhmMXZsa0J4SVl0TCt5WGZEME1oSlZC?=
 =?utf-8?B?YzJydUppcXBhVHdTZ0FMRllZZVlrb0h5aWI2NVZ2emNPSnJYSUN2YVI4UHdP?=
 =?utf-8?B?emNJZ29idkhXTk1GNXJEM3RrTEhkNXpScUgwVXNVV1pWVytYS1NXU0swZXFw?=
 =?utf-8?B?NTNhb3Uva3JwNUJqYWNNTDQvMmg0YStpZUE5cGswWmxMcElrT0hFa2JUbUpH?=
 =?utf-8?B?d0k5cys3L2twR3Y1c3VyL1dRRlFHTUZDWW5rUkd4ck51MnF2d2JIZzdaMFho?=
 =?utf-8?B?YVd5cVBFNlFrTmhxS05ndzFZTVlmUlBINlZXbDBwRTY3T2gvSk55WDlFVkNy?=
 =?utf-8?B?MXFQMFpyU2FDbEwwdlg0RWpTUktvSTUyMWt4eTBPMWlyVlIxN2hKVnJzUFN3?=
 =?utf-8?B?Nkh5NmI5SFUrNHhiMEI1aFAzb1E2NzlyeUFFVGloZy9mWHBnSC9sZ0ZwVmVs?=
 =?utf-8?B?MjJQcnRtbEpzQ1lpMGxrMjM2SmNqV2lIUFhqY2lwM24rSmNraTJMbUUyblQ1?=
 =?utf-8?B?RGIwUkZJbHd2SkY1OWFrVjduNUlUMjBmTTdzOFV3VXdSS1BlRXpVM0Exdmtl?=
 =?utf-8?B?WHFMYm1EaHJpenFLTTkxbnlKVjNHV1pQeHNQRFdoalZ0VnhmNmRVblU5emRz?=
 =?utf-8?B?R0ljVVUyZGdwbE1CbEZYS1RmaWRNdHlJNEcyeWhWNWhmdmF0c1lSSDdRK2tK?=
 =?utf-8?B?c0lyZFdoWWpkZ3hYcEVzODRFdUN1ZzJaUXQ3ZW40MlpXc0owNmNodEJRa0Z1?=
 =?utf-8?B?dlBYbTc2dW5Gak50enRxWjdEV0Yyb3RWK1ZsRStYamp6aXNpa1NBQldoVFB1?=
 =?utf-8?B?ZEtFc1dqMzBVQmg5T05aVDJYeExkKy9CL2V2cUdSckFyK3V1VHVhQ0E1aGsr?=
 =?utf-8?B?cCtiTENLUzZyNGdFY3hER3QyRHUxc0YyZDJPSUpBSU9rYjlTZlZqNEI1bkxU?=
 =?utf-8?B?enh1eG8rNmE0MFFGUEo5ZzJWUWFxNDlIWktTK05VNWRRWWZiZlQ3YXd4MnNh?=
 =?utf-8?B?SExVMkg2Zko2a3ROTEdpZm5PSlZwOE9MbmZwNmpuZHZHeTI5cXFERnVrQ0JQ?=
 =?utf-8?B?L0FjSEZLMDNOQXlud2lRMmRWQTJDMVhGV2pTQmY0VmpwdWkvZ0Z0c0Y4d2Iw?=
 =?utf-8?B?dWhjYURkTkw5cVYrazJOTHk3elVZWEsxajFwVjQ5a3FMNTUvUkNITDAwc1Y3?=
 =?utf-8?B?RGZqcXZVaWhmTEwvcGp1eGxvNzZIakQ3Vk02WWVsTk4rVTZvSnVmZEcxWUVa?=
 =?utf-8?B?OEZmVURCand4MEZPYzVRaG5COWUyZ3QyZFZROVQ3TFRiZnNVQ3I5M1cwa0R3?=
 =?utf-8?Q?OcZilCvebCCuCoEZbAJunz7ArIG69eUDMfQcLSa4/GRbO?=
X-MS-Exchange-AntiSpam-MessageData-1: /EizZcZ0ZsT2sA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b9604c-fafa-40cc-6cff-08de7660ef6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 00:33:04.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSll4Z1YqzsEe1L0Kjwo8ZOfJQ1CMmR/CBfHqEuuxj2YZo1ktXgZyOzs5i3FrJqz7A80r5nzb5bAwqk+4I2ggA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF2FA070BDF

On Sat Feb 28, 2026 at 3:02 AM JST, Gary Guo wrote:
<snip>
>> +/// A pending I/O write operation, bundling a value with the [`IoLoc`] =
it should be written to.
>> +///
>> +/// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`], [=
`IoLoc::init`], or
>> +/// [`IoLoc::init_default`], and consumed by [`Io::write`] or [`Io::try=
_write`] to perform the
>> +/// actual write.
>> +///
>> +/// The value can be modified before writing using [`IoWrite::update`] =
or [`IoWrite::try_update`],
>> +/// enabling a builder pattern:
>> +///
>> +/// ```ignore
>> +/// io.write(REGISTER.init(|v| v.with_field(x)));
>> +/// ```
>
> Thinking about this again, I think we might still want to write
>
>     io.write(REGISTER, value)

This was the original design, but as you point out below this makes the
very common case of writing a register value built from scratch more
verbose than it needs. Real-world examples are significantly worse, e.g:

    bar.write(
    regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
        .try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?,
    );

turns into

    bar.write(
        regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(),
        regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
            .try_with_offs(load_offsets.dst_start + pos)?,
    );

>
> Granted, this does mean that we will write `REGISTER` twice in some cases=
:
>
>     io.write(REGISTER, REGISTER::default().with_field(foo));
>
> But, we have no redundancy for the update case:
>
>     io.update(REGISTER, |v| v.with_field(foo));

In nova-core, `update` is less common than writing a register value
built from scratch. That's really the only thing that holds us from
two arguments in `write`.

>
> The reason for this thought is that conceptually, the type of a register =
is not
> necessarily coupled with the register itself. This is the case currently =
for
> register arrays, but also the case when we think in the long term where

For these cases I was thinking we could rely on From/Into
implementations, as it gives us the option to make the conversion
explicit and thus less error-prone.

> bitfields become decoupled from `register!`. People also might just want =
to
> define a register of u32 without any bitfields at all, and in this case w=
riting
>
>     io.write(REGISTER, u32_value)
>
> looks nicer than
>
>     io.write(REGISTER.set(u32_value))
>
> Spelling out the "offset" explictly, arguably, is also more natural for a=
 C
> programmer, and also simpler on the implementation side (all the helper m=
ethods
> on `IoLoc` would go away).

That's true that it would be less `(try_)init` and friends helpers
(`IoWrite` would also go away I guess?). I'm not a huge fan of these
because they only cover specific initial values (zeroed() and
default()).

Maybe we can macro our way out of it?

It would look a little bit weird to resort to a macro just for the write
case, but I don't think we will be able to work around this without any
kind of compromise. FWIW, I think the single-argument `write` is a
reasonable one that might look a bit surprising at first encounter, but
has the benefit of reading naturally.
