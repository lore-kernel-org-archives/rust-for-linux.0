Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021106.outbound.protection.outlook.com [52.101.100.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4917C211
	for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778961505; cv=fail; b=UrsMCGXfccYOscNAC7sYFf0tQODrxOSiLaOgoHj4jVIs/2DVo/6sXROnjdJTwMF3UPhACFG7E4AqNqohYejsJ2nGfB/qzbdu8Le7WLkhrZQK3yCJGS1UMx7+xqlahmsEU1OWtkNil8N0wb10Np+odaNgbmGxzpEX9NU+ux1WkxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778961505; c=relaxed/simple;
	bh=MAOYKkcq5hyVco+mUTsTPzNcednHxMSmL48P/ah+RLk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pgrm4NrAqYqrO/UjN81wkGnqWzHxFaKlunWefYqXlLSppDCNE6BVS+ai9yBnPLhuWJMxKzB2yVdqaa8t/EZIjLMpFi1G3gsGXygHnfWNy7QhRaHO1XvJ9L62wshDIdrIx7hKngcMZJilODr8vtMgIG7SCzyR9DmZkKwdkZu+85g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zo21eA6X; arc=fail smtp.client-ip=52.101.100.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zo21eA6X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU+GlDJUztd674j5G/uOzPbcNmNHkI+N+urBwoPtWYaAToInHsRCTsGQHH0eGRHA6FT/wG3+wYN5QSiXHWCQSOwBCiKZ5YhTbyXohZyQn/cwq3LKhb6Q3sxhyon8rwt2FvIhJnIbu9E7UBpRUqD0TvqA37jl1Av9pb52G0ZgfrxjDYlNUeON9L3cI8WO93QoFNiy7RcC1xbmBvbfgwQCycO4cYESwI4tO02/bPnd1XnRr0LoNbS8By4FzPkI/BQIWkQirT9AXxoYj1U1dGYn+C37V97yExXDHCNl715H5xujDatpLlsXB9d79gjSkpmdJuElMuFtwsXgfkOjPbWVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PH9SeUQKs07yOcWSY0KjkRBfEcrozgDn0OKYaKfa29A=;
 b=DZJBpeNH5D2hYZgBcinEsGfGK+YtaMSaaxM6JGoK0IKhLLxOpWUJ39niSuMkXp+8nzuiDZfN8RTRc1qEJIJY0UZ7H4oZT4oWJZ+53Yv5trQAUNIT+ImBHsmVYb52wtD/2MerGufTGzja9p7Uo2wG7o7KjbZzDh6+68EcusosekYaRxuKhJ20ANPEw9Wdk9eeVFD9oq2dK00quY866qzKk4iFsTWetUNGo7C6r2BfNc8NI0att1+I677X0aTdGYh+lEMKX3tzbwvqVmmWAoCxOhMZAqo20p15gKQidgf9CF/b59fCVbIZSQLLEvDP7ofCAup/v1yOytXe3oixYKhlnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH9SeUQKs07yOcWSY0KjkRBfEcrozgDn0OKYaKfa29A=;
 b=zo21eA6XkUpK3R+3WOC5jfvLZth2C9KYYqk933EYOS80kDElqk5WV7YeFJ7ExrRjq2Q7Wka7vXNJETxeXxvuhsaZhl3u7jV5xHEaUrQf9uuiiMEf0aTd2vs+nIEHboAAQehF72p6BLFN0/WRUCBTRmnub+1XCoIIq2RKupaoE0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5894.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:289::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Sat, 16 May
 2026 19:58:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Sat, 16 May 2026
 19:58:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 20:58:19 +0100
Message-Id: <DIKD7YHDGMQE.203C29N5H5AWJ@garyguo.net>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] Untrusted Data API
From: "Gary Guo" <gary@garyguo.net>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Benno Lossin"
 <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250814124424.516191-1-lossin@kernel.org>
 <2026051610-flint-compound-810f@gregkh>
In-Reply-To: <2026051610-flint-compound-810f@gregkh>
X-ClientProxiedBy: LO2P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b77207e-9c09-4a2d-db39-08deb3857a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|22082099003|18002099003|56012099003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	2dsWf2uior+anpoDc8DLqB1VS/HFMYo3ORDMDOgOcQTq/PcHq2py+FCMvcalRFsLOm4cQIKq7dqQjMlbI52njxhvY3hyQ9ehOsf5F3EozWJUhLM4vEWR2eXrohv5NYqPGmEcJbkhdXL1Axu9iUAFgB3xG2ljL0iW+N+Xlgl+XD1T4Y4RmTUWPT7pnF9gQYy0RXrT9ECSLxiO8hGdR9/Vl7O7+sWSl6pHrZ827enlOIrMdePe3vrBPQ7oo/3z7Q/gi83S5uGo43GHUDB6F98WOd1TEYW2V99qvMxgQtkrxSjktoDvcdzaua0hwz7JDBRD9QzAPmJqBeb/Psqc9oXmR/G1uTb2PGMnZAhNP7XcEIzl93jawHZfb4FsUsFOXGDGqp+X0ho82XKrJfcmedPqswH/FXPYt+0EiZbiMUypOJyJck/CYd4qxVE+rsI+z7zwA2WZarIQhD8dygb5x8n4Xgvx72+dJIyi09ODhVjQhrwROy/3VnhU6DYRnLByZM4vflxyhafgNaj2DGgd6rkI+KhWolwac0C4elGsq35L5Xn1P/8ZP7JuN4Qj5+eneLJ1G3WMVpRJR5SO1ecYWCFX2o6sQFBsk1XC0QMfw/bZPpM+rZJTu2d5R5/01gfF5dQEelaypnBARDC+O2kdYUEkiOdij6xk3k+jtAsi3AZDvC4uJePDr03gxEh0jMIO6SxpuIYiCuAW9m9BnUzSbMtwWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(22082099003)(18002099003)(56012099003)(3023799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2htSmpDb2ZueFNkQkFCZ2d5S0Fhc1UvRWZlRkhnWVBXZlRpUjlpS1llZ0g4?=
 =?utf-8?B?b2V0dlArQTVQYUs2ZGdZWjgvZ1dKRHBuM0tEUTllbGF3d0s2ZmV2TzcySEYw?=
 =?utf-8?B?WWZQcXhxaCtPdmNMZmNsVFl1L3U0UzdDUk9ia013UUM3UFhNQy9oSzlndVVF?=
 =?utf-8?B?d25CdG5DY2xtOEJQNTVSYUwzOVNMeHFLZk4xYnBySE9VZ29wa1V1RWUraUdh?=
 =?utf-8?B?TTR1ampZeVN2SGNFUVVtY0pLemgyNFFUQVF4dnlidEkwamljbFBteUt1b3RD?=
 =?utf-8?B?SElYUURFcXpYUHFPeEIvODhvYS9lUUtlc054RWJRSHo5YmF3aVlCZFRKRXdZ?=
 =?utf-8?B?L09YRmtaUDBtYWhDWEtCRlYwVVZwWmVSR1J2OW9ibkZlYTNYcEYzamxRTnN1?=
 =?utf-8?B?NHhDMk9TSDB0a2lzekphODUrVU9FWjlNYy8wVi9XYnN1ZVhCWnZTYWhhVnhj?=
 =?utf-8?B?dTl5UUs1RW1tUkxNRlkxTVFtT3ZXdE95N1FpeGZmZWpnUE1lQkxPdFhoK01Z?=
 =?utf-8?B?QklDeXVKT2JaeGlzekNnNFhCdytFK3VRWm1rM0lLa0sva0xaa0ZiVkFaVTFm?=
 =?utf-8?B?VTJIbU05MTV3VjFzVWtyRXMvVEpickhFb0l2TDlVb3dwNzMvOTA4eTlHeU5w?=
 =?utf-8?B?bnpCR1Z6OW4ybS9GTTFVN2NLVjZrVHhnRHcyZ3ArMk5POTg3Vlc4eUVZMU5u?=
 =?utf-8?B?UUZpRVFPenBGMmt0ODhkWUY3MFR1WEhJQ1ZVMitzd1lmOW1RQ0lWTWdHNjgv?=
 =?utf-8?B?TVkrRFh6OW1JcGl5ckdxNmdNVnZmZy9qckFuV1lZQ1RkeEFlOWxjeHJLdmFY?=
 =?utf-8?B?Q0lhOWpFSFJzdGdMM1JleTl6c0VzNE8xY0U2aUdna3U3MlI4MjBjbFJRaEpo?=
 =?utf-8?B?bjJ6bGhHcUFRWHJXci9sMWZOdG5uT1hPYVB5VVJIYU1SNndSM29Iay94eHNO?=
 =?utf-8?B?UlZMOTJZSTFLeXRCbGJGRERITmRSVWhvOWtyOGNKNFNwMkhEeVY1SlhJa1Jm?=
 =?utf-8?B?aXdmNURncG5IKzQycGIyeGs4UFBqZ3JDV1dnaTV1bW5SSEFmc0xDY2FQdlRT?=
 =?utf-8?B?UXh3MU0zMExiNmQyWjc1OHA2THhMUWFvRGZpV0Zyc0ZJdVBiWTlRNkhidnI0?=
 =?utf-8?B?ZDFvcFZ5Q29kM1pJaXUvRU1lTnhOWE5TYXBTWHQrMzhTVWZKbGhMdUZOa1pT?=
 =?utf-8?B?c2pNK2JjT1BVSzlLZWJVTEdUb2sydnRDWkpXTWpLMmJvL2QwOWM5U3BjT1ZF?=
 =?utf-8?B?NkxYbmdoMWE1dkZ4THJLUDJ2UUtjaHhpMkU2M3dPbTcrMkJOcU5EU0RFdnpC?=
 =?utf-8?B?L056clc5TGlWRksrblhQUVNzQnRxL1Zic1FndU01SXdwOHFGcU85MHRqTnA3?=
 =?utf-8?B?T1hMaS92Z1JhRXcxU3pyRmpDTnN1NWFoTUhRMWRMbjJxRkdjZldHZlVwQnMz?=
 =?utf-8?B?eXdtREhEOUt0Ri9jMEZyYVkyVWxmZnRGMjlDL3dCYWJmWEJpREd4UkdyWFVY?=
 =?utf-8?B?alpzUnNzejNMaVFpTmlQNzYvRWFJVmlHZXdBVTU5ekVhdkxvSEJkVFY1NXpu?=
 =?utf-8?B?OEZXY0hTVG51SUtJZUpmUEUwQlZvQ282dm1NUFNRU3llSkdyRTVGRFpTeDUw?=
 =?utf-8?B?bk5iVlgwa3FvYTlQMkJYTUVlUXVTVE9ubFNIakVyT3Z2YkFxeVNSN0wwbWcz?=
 =?utf-8?B?SEk4QU9sRndDY29acForZE1pQ1ZUWHlLbHpqL3FDU0tNMDZqeUNoajZ5ZzF3?=
 =?utf-8?B?M1MvbXQzeEx5TitHbFJ3dE5qNTRPYlBjTTV3eGJiN3pxWTd6endCZmV4QmE1?=
 =?utf-8?B?NVJzVmZTYk82VGJDbTB5bk5SVHptVTJsVkJtMnc4NytjYkNzNGZGTHMzQ3JZ?=
 =?utf-8?B?RVFpOFAvSFdjeTZFNXd4MzRRMWFpUWJCR25oYnJqS1dGU3RVL1B2N0g5RzV4?=
 =?utf-8?B?dWZIcFZlbkhoN2RDOWt0M1o1aHpNQ1RjeWFSUnZFWjhpNi9WWDgvaWMzTVpL?=
 =?utf-8?B?OGU3RGVhQmVHRmhsRTJBL3BYZVpoOEJyZEp3RHJjWTJHUThIRHE3Si9WU0la?=
 =?utf-8?B?QXRPcnBMRnpMbTVKM3BYK2JLYzFFYWNkSldHTW5uZVA2eXBucmczMUtOb0I3?=
 =?utf-8?B?bE4vSVRlZHB5SEZ0S3BLb3htMFdicE1mV0JEdStKazZESTV4aXhWNTNGNERT?=
 =?utf-8?B?TU5MVGVuREp5RXVUMWhaWkVQY01LM2s4VEFlUUFkbUNGYTBrbnhLbldlWjBo?=
 =?utf-8?B?eEIvZnlUVVEwalA1WWNabkhEMXo5SzhFRFE5aVY1ZmFBb21SUExsTFFNclhp?=
 =?utf-8?B?ay9VcGRSOEFMajB0dmxVUlZ3MG9KZy9WSGowM2VWdFoySkhCOUZaZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b77207e-9c09-4a2d-db39-08deb3857a2c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 19:58:19.5675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvBth353PtGAdR5i+OlxJo9s3qiHzSyiHSeMHLvFkIPGl5MAZl8mg/Mt+AQRJOhH/DcBX+e/QjJOsre4p9JI3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5894

(Resend to reply-all, oops!)

On Sat May 16, 2026 at 2:21 PM BST, Greg KH wrote:> On Thu, Aug 14, 2025 at=
 02:44:12PM +0200, Benno Lossin wrote:
>> I didn't have too much time to spend on this API, so this is mostly a
>> resend of v3. There are some changes in the last commit, updating to the
>> latest version of Alice's iov_iter patche series [1] & rebasing on top
>> of v6.17-rc1.
>>=20
>> I think we should just merge the first two patches this cycle in order
>> to get the initial, bare-bones API into the kernel and have people
>> experiment with it. The validation logic in the third patch still needs
>> some work and I'd need to find some time to work on that (no idea when I
>> find it though).
>>=20
>> I also think that field projections are necessary to make `Untrusted`
>> reasonably useful, but I'm open to adding a stop gap solution in the
>> meantime. There has been some movement at upstream rust on field
>> projections. I submitted a project goal for 2025H2 [2] and it most
>> likely will be accpeted. I also opened a tracking issue [3] for the
>> language experiment that will drive the design of the feature.
>
> Ok, I finally carved out a bit of time for this, and moved the user
> data pointer rust bindings over to use untrusted, which looks like this:
>
> [snip]
>
> Now, this obviously blows up the build as everywhere we are attempting
> to read from userspace data, the buffers are marked "untrusted".
> Ideally this would be simple to just go and make all readers implement a
> Validate trait, BUT we have fun things like the debugfs bindings that
> attempt to do automatic conversions of any type being read from userspace=
:
>
> impl<T: FromStr + Unpin> Reader for Mutex<T> {
>     fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
>         let mut buf =3D [0u8; 128];
>         if reader.len() > buf.len() {
>             return Err(EINVAL);
>         }
>         let n =3D reader.len();
>         reader.read_slice(&mut buf[..n])?;
>
>         let s =3D core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
>         let val =3D s.trim().parse::<T>().map_err(|_| EINVAL)?;
>         *self.lock() =3D val;
>         Ok(())
>     }
> }
>
> So, converting the data to the "correct" type is a fine idea, but then we
> really want to make the data in that type as "Untrusted", right?  But how=
?
> Force the caller to make the type definition as untrusted?  Something els=
e?

Forcing the data to be "Untrusted" can be done like this:

impl<T: FromStr + Unpin> Reader for Mutex<Untrusted<T>> {
    ...
}

Although I suppose for debugfs you would want to validate immediately, so
something like:

impl<T: FromStr + Validate<Self> + Unpin> Reader for Mutex<T> {}

Although this does force `T: Validate<Self>` which does not allow type-chan=
ging
during validation.

>
> I thought about a "blind" movement from untrusted->validated in the buffe=
r
> here, but that feels to circumvent the real idea that the data coming fro=
m
> userspace is "untrusted" and must be checked before acted on.
>
> I have run into the wall of my rust knowledge here, am I missing somethin=
g
> simple?
>
> Also, the one user of this trait so far in the SPDM patchset:
> 	https://lore.kernel.org/r/20260211032935.2705841-1-alistair.francis@wdc.=
com
> is doing just "this is a C structure, so all is good" type of validation:
>
> impl Validate<&mut Unvalidated<KVec<u8>>> for &mut ChallengeRsp {
>     type Err =3D Error;
>
>     fn validate(unvalidated: &mut Unvalidated<KVec<u8>>) -> Result<Self, =
Self::Err> {
>         let raw =3D unvalidated.raw_mut();
>         if raw.len() < mem::size_of::<ChallengeRsp>() {
>             return Err(EINVAL);
>         }
>
>         let ptr =3D raw.as_mut_ptr();
>         // CAST: `ChallengeRsp` only contains integers and has `repr(C)`.
>         let ptr =3D ptr.cast::<ChallengeRsp>();
>         // SAFETY: `ptr` came from a reference and the cast above is vali=
d.
>         let rsp: &mut ChallengeRsp =3D unsafe { &mut *ptr };
>
>         // rsp.opaque_data_len =3D rsp.opaque_data_len.to_le();
>
>         Ok(rsp)
>     }
> }

Yeah, this use is confusing between two things: invariant of types and whet=
her
things are trusted.

Given a raw chunk of memory say `[u8]`, it may not be allowed to cast this =
chunk
of memory to different type, say `T`, if `T` has some special assumptions o=
n the
data. For example, `T` may be `NonZero<u32>`, then it's invalid to convert =
a
all-zero memory to it, this is known as validity invariant.

There's also safety invariant, so e.g. `[u8]` must not be turned to `str` i=
f the
representation is not valid UTF-8. Or it must not be turned into `CStr` if =
it
contains interior NUL.

We've already have a `FromBytes` and `IntoBytes` trait to capture both. Pla=
in
old structures can implement these traits and the type system catches you d=
oing
a cast (or transmutation, in Rust term) incorrectly.

But `Untrusted` is on top of that. It's a marker to indicate that this come=
s
from user. Regardless if the marker exists, it must still uphold the type
invariants. So in some sense, the code snippet is basically unconditionally
discard the marker, because the only thing it checks is the validity invari=
ants.

FWIW, I think our `User` API is not optimal even without considering the
"Untrusted" markers, because it is completely untyped. Taking a IOCTL for
example, you know what the type, so it should really be a `User<SpecificStr=
uct>`
and then you can read out `SpecificStruct` or `Untrusted<SpecificStruct>`. =
I
have been thinking about doing that for a while but haven't had time to tac=
kle
it yet.

Best,
Gary
