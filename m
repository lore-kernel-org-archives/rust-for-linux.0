Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022117.outbound.protection.outlook.com [52.101.101.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398B3A9DA4;
	Mon,  9 Mar 2026 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070245; cv=fail; b=ud6xer3yZ1kSpLqJSHO5dWo2xEUoUMiLfQG8zv3A+CK54tq32a6F74V4nrEWScmuE0Hot4Huo0FZZsrIM3Q+7ZYirPzlQtY1Cp4Ag81ugrAv9ovWRizO/JQfRC+6kxgrtnW7i52SZFbhGTyk4JfW3gU51kdC/BPE0OLtAMbScDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070245; c=relaxed/simple;
	bh=QdZcP/LACdbPOpM+dUSJJwxGovbRw1C+MGKwQSSYK80=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HIN/RWoKDK08gdgyBw4A5RnxEfEOiWW5hLK/EphVWn8xrY9VQN1578HrO6It7hsHnQ6lFcXPa9YZaX1bZ10vaN5i6wq+/sB0TpJJR3IS++nwoe0SIiWoqUUSuXX2j90s0gGIi/bIlXkxBmQcAK9ZONQORQnYMJeaumLZGCmFG1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Bnuw9RH1; arc=fail smtp.client-ip=52.101.101.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Bnuw9RH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6lQhjQqnwHpGnn1oE6Gb4rVUQNYgJmgPszKKcuVUgHdVvdZABK5czIUPvNg7zY9xFZNows7bBXFxOQvRXMZgCQPz4+hG5xFs0HciuBqfJQVE1EsBozjMXn/gmGnsz8r/43tvn+Y3vamIyDhhK50N1vczbnoUSkaO+W0VE3niR7igmwsmwi6IlZjol+EFAb1M0kgM/zDPZ+CeG8s4vETj234Ic+e2qfJS+tWSWDd/Nk3VzqFNIfgPbakFTjCbo4r9m9Cuc0PLnUFlMOQPbG3uPVlCPVS78c1QIbsk/xwU1xhriWm6U9H6QHddv6Oyz1toYSY5SpTsDgbqFp2sbkJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIy1mXjsj6hAo67QR5V2mtkm7Tgn/z5/+9QzSrn3EMs=;
 b=AYp/IaweJZs49a5Kip32ELxDVBIROHi8ESt1I7G+k3hMjYmR4h/FlC63d0J3OzuQuCxFSZ3Au1he4tRny4rHIY5TxBYmJidRFnWTrzoYthweeYZXJnsokPy91t1sypRM5MbUisbdkAlar6r2O7Jcp/+G5TIKg3ANVMRE3PoFh/HlphwIfmJKPeWEByyVGWJa4yve76wDPcCdDke4MVcn9mujOnrdNN4H9q99pVbjfDXhrd9QvOIWqT2ylVVoi6bd8IyqB4y6Q3FQFtnToXwOxs2yeuulAwv2Xo4+2HwaxMEO8CTm6XxtFbsnsBPoZLlqOHmBLUHucHwnRgAHDXXZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIy1mXjsj6hAo67QR5V2mtkm7Tgn/z5/+9QzSrn3EMs=;
 b=Bnuw9RH1FXc59jc4yN3aMx7QhmKvPPUyjrImTpyx0+/DfRC+UN0IUSf4phEORnlKPh9bF7fv2BFk+uLDs/hYMwO+lMmCYsDagdr4XiranH1c2semiF9UC6PWsj190MS9zZ9++jNP75x5DsVl+j1ei0A7ZceyUl81LNwoA7h4WQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB5931.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 15:30:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 15:30:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 15:30:39 +0000
Message-Id: <DGYCXZ3BGN5X.1ZDK1YSNDXWRU@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-7-424f80dd43bc@nvidia.com>
X-ClientProxiedBy: LO4P123CA0376.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c0efa8-4ee8-43ce-a206-08de7df0d1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	VPjGs0OGsw/UQ1pO2eV5JpzcC74KIvep/rPpKRYFhrxlU1lKE+aIoPojFsK3yZQLarDwVZ9njmOcZwmULzAsiPGeFGbkZJGk1UyDW7p/8N26B1ixGiq1KotYHItAN2Vol+0hO4OTALyVqpCaQiorLAaN+kOLieaB1aD49epqpo1hNOzzbnUFbYHIXkhqoQ5CD2AbeVulq8/j1m02dO1dtuYPM0l14Ay34Tm7/BYkOFqN1swJSBSAph3mlSVTH4/pmvLOPIQNw9ZElwPSjsOB/5LekHBZnERneQ+QQ/48P9GsEA+yV+8srl6X/jtahGUkR76GhtQINlxUCDtLh8uvYUNgtsNvLsY8FS2ct8gf9DCFOZKeaGT85lIOOw9MMuQBxVFqYaocXMN+mQNTQzlWvq37xrxV/5jFQWj/NfYJX4c7uiCQBx9QxP1egcH2PU+bC9if1EImFy1dmc2c3xMea4zal7buY6Z38LFQcXngHvCFc/u24VgjhGBBe6mb+9Ut+5dvbgT4ircke7h8IJpnf9qZ50avkNBYe6q5oTAaiOTkKpGg9kxGcLgxccKPJkBwhwVwbKMpKQQ9OxvS2LM0PPl+VqU6rGDgscs+fPKl4872wROplxjEsfz335ws9mCi1fGAbNX86fqMOeIZfJv+jr96k+pNJTC8SAmfOvC7Pk2odshuWVxdiBzI6eDhLQRxsJLaIOys1T8lrOuhVKux7psBGoWRkbr+zqasMxmLXzH6/qmBS03v9HNnPTBfSr2TgQFdRzwP+m/qMNqr6CYqBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzRVRnR6clpSOXE0Um1hb0FOemF3bjV4Sm9LaHlaRVROOG14T2hickZnUUEw?=
 =?utf-8?B?b0NuL2tQWUFTOFFiYUFZeDlmdTZIeDFMUS8rSy94cXJETGxxZ3o4TWhGKzFT?=
 =?utf-8?B?bFRvQ2g4Q0QwMFpUZVhXaCtJM2wzNTFyOE8rMXoyN1ZxeXBWVkgyOE81blVz?=
 =?utf-8?B?Zkx4WGMxOWZEME1WbGZ3MllIQUNnS2ZLQVBTOUprOStKSEZYcGxtR3ZKa2sw?=
 =?utf-8?B?ZUkxZkFXbUNBV0R6K0VFQTdUamZKK1hzTEVuemF2MjFGc3NsYUJjOHo1U0RG?=
 =?utf-8?B?eGpNT3I2MEJYV2I5elpvK05KTjh2UExaazRIcnB1Z3Z0S25aWFR4Y2VLQUhp?=
 =?utf-8?B?SDRCNEN2WVpoSGN0WGpEcU50UW9DajdlbEM3cmw3MTlHRzlTV3J3VDZzYzlw?=
 =?utf-8?B?aUh3QnUrSTRjWUljcUNmTGR1Yy9aaXd4L3NkYXU5UDBTQktmRnlrNGc4YzZz?=
 =?utf-8?B?emc5ZGtZK1pITlVvYm9xTDFVZCtZOUlYcndpdUE3ZE05bFJpKzFFOVp4RFFk?=
 =?utf-8?B?OHlwVkNsUFVqdU5tcjdhM3JSZHlIWDQyZVN6emhBS1FmK2c4Yml1ejg4T0tu?=
 =?utf-8?B?NUlFY2VkSzJpd2RuR1grWUNuVFpqTG9kZUZkeFF2Q1htYW05aDZSRFgyL1Bx?=
 =?utf-8?B?MTlqVUJnQ1ljVDF2amdGamZhUFlSdUdGR2JQMDErV1E4NW43YmtQNzRZdUNx?=
 =?utf-8?B?dFFUbG9ROU01dmxkenFRQlhlMHNGcFdWQng5MlRFOUtKdW85NEppZk9Bd3N6?=
 =?utf-8?B?NkxWZ1dQK1h1UW1tYUQzVTIzTUtOSGhFb3BhcU90ZzVsODN4V2t6SHpwbytn?=
 =?utf-8?B?WGhaeUhmcUFQUkZDdjZnaWxOUkIwRjNZblBKOTZmekVSdFk4ZEl2VGllTmtJ?=
 =?utf-8?B?enhJYXlWZGpuVHlDMm1YVzV0RzZ1eWJCVFdScnRIa3FzVVRXWGgrckxTZzh3?=
 =?utf-8?B?VURqOFd0elNJbi9RK09OTzVBVXVRdXdTT2xJSi9vRGQwT0tPMkRrYUs3OXRq?=
 =?utf-8?B?dVNoaGhUcHdGdHFvSThwRnBGWDZBQ0RrNzRBT0NkN2gvUUFTaWplMDBuYlUw?=
 =?utf-8?B?eEpwL2JhOE9EY0h0a2ZxcjIwYWEyYUdVaEs2Kzl2YlFxTllWZzcyRzRGTTB1?=
 =?utf-8?B?eUlJYktaZnppYVhGdXh0L09oRFZGTm9xTll6Yyt0Y2tDZ21hamdFTDNJUkpy?=
 =?utf-8?B?UzV5NzZkSHl1M25mQWZWQzFVYnF0NERmNFNDUWp2bXNWVkhuZ29PclQ1SVZu?=
 =?utf-8?B?L0lqVmxqUXl5OVhXNGVMNWVCaWY5RzVtVjNBcE5ma1R1eW5WOUVRaEZQaU9o?=
 =?utf-8?B?emIyT0RaOTZ1NzVKanFtaVJ6TmRkaWFqeGxncmpORnBPYldaWFlaZlZYUFNn?=
 =?utf-8?B?V1FUQVVpQzBkbnRmOC9pUm1VbnlmV3d3ZXFOS3FQaGRJQWZmTnNNRmFUNjZZ?=
 =?utf-8?B?VUFOdm1Qb09lUUt3d0Z3SUFWUzZTOW5PQjgwY3RNdjQvUHNvZFZ4ekpvR0VZ?=
 =?utf-8?B?ZVhuVk9aWmRKQldHaFRLbHNzeFhOb0dUZ2xpcCs0cjdWN3NpS21qQ0krVE1h?=
 =?utf-8?B?azVINDVoS1dMNG5pNWRSbUF3M1QxSnFKQnVNelQ2T20wTzZ2aUVCTmozbkdJ?=
 =?utf-8?B?RWtCcXJVMmxmOGsyK2pTdUZhc2htR2NCOWFZQWlzVHc4N1ZSVkhvTFdZS29l?=
 =?utf-8?B?Z1UxTG1lTWs4elV6b3ZmeG0xcjNZSUtTdUVRQWVpa3pKTmFOZ0pLaTMyelRp?=
 =?utf-8?B?K09aUThKTmZabDVHSzVzOUE2enlYS2owV29LalBrRlNlbUZmODdWNGh5Y2NH?=
 =?utf-8?B?Q0RFLy82Wmdqbjh5OEhDMmZrc1hBalZDd1g1L3RPMmhnVG5heituTFBza0Ju?=
 =?utf-8?B?OEkzREN1WWhCZkpPSlVnK2gydWlpbHZEZ3ZhZXEvRWVXTnlFa1IvWFl3amE5?=
 =?utf-8?B?anRrZm5ndWpYalprSlhLY1dqWlJxcjBaYUpvWU9TR0s4SVdRRlpOOGVZREdj?=
 =?utf-8?B?UlExMEVIV0s3TUpmcUEzbVNEY0tvcHNBRVphVTk2MnBFYlJzWCtnUVFqUGNy?=
 =?utf-8?B?OHNvcldZTWtsUGNOODhYMU1HLytQSmVQWkNRekh6ZkU2WEcrNXhqUkRmMlZ4?=
 =?utf-8?B?amp5L3Ird0FqbEZrdEIzaEFXSTRuSldjdUltdTM1YXJRNk01ellJL0Z5M2RY?=
 =?utf-8?B?ZHNPMjVnYkNSbFl0YUY4MkY2cVY4TXBtNy96L2FRZm9sMFRxMjhVazE0Qjlv?=
 =?utf-8?B?bndQTTYzSmhOMTFJT3VKY0VCalVXL0FCZXlHNWNKT2pHMWZTeWVDQ1pwcFZ0?=
 =?utf-8?B?NWp4Rmo0amtEUzBRZWw2SHgzeEVGQThrZXVTOG1uRDVxeGpYN2RJQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c0efa8-4ee8-43ce-a206-08de7df0d1c2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:30:39.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7rAskWtoXdEElNV9c4d6lm6op37RwEnq5HTd5dzy6iY5cnH9GUz/lYZwn9t811m2q4IWXXFWKkczLpoS7i1xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB5931

On Mon Mar 9, 2026 at 3:14 PM GMT, Alexandre Courbot wrote:
> Some I/O types, like fixed address registers, carry their location
> alongside their values. For these types, the regular `Io::write` method
> can lead into repeating the location information twice: once to provide
> the location itself, another time to build the value.
>
> Add a new `Io::write_val` convenience method that takes a single
> argument implementing `IntoIoVal`, a trait that decomposes implementors
> into a `(location, value)` tuple. This allows write operations on fixed
> offset registers to be done while specifying their name only once.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs | 68 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index ed6fab001a39..09a0fe06f201 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -216,6 +216,22 @@ fn offset(&self) -> usize {
>  // Provide the ability to read any primitive type from a [`usize`].
>  impl_usize_ioloc!(u8, u16, u32, u64);
> =20
> +/// Trait implemented by items that contain both an I/O location and a v=
alue to assign to it.
> +///
> +/// Implementors can be used with [`Io::write_val`].
> +pub trait IntoIoVal<T, L: IoLoc<T>> {

Is this generics instead of associative types for some reason? If so, pleas=
e
mention it in the commit mesasge.

> +    /// Consumes `self` and returns a `(location, value)` tuple describi=
ng a valid I/O write
> +    /// operation.
> +    fn into_io_val(self) -> (L, T);
> +}
> +
> +/// `(location, value)` tuples can be used as [`IntoIoVal`]s.
> +impl<T, L: IoLoc<T>> IntoIoVal<T, L> for (L, T) {

Missing inline annotations.

Best,
Gary

> +    fn into_io_val(self) -> (L, T) {
> +        self
> +    }
> +}
> +
>  /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
>  /// can perform I/O operations on regions of memory.
>  ///
> @@ -463,6 +479,32 @@ fn try_write<T, L>(&self, location: L, value: T) -> =
Result
>          Ok(())
>      }
> =20
> +    /// Generic fallible write of value bearing its location, with runti=
me bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Tuples carrying a location and a value can be used with this met=
hod:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_writes(io: &Mmio) -> Result {
> +    ///     // 32-bit write of value `1` at address `0x10`.
> +    ///     io.try_write_val((0x10, 1u32))
> +    /// }
> +    /// ```
> +    #[inline(always)]
> +    fn try_write_val<T, L, V>(&self, value: V) -> Result
> +    where
> +        L: IoLoc<T>,
> +        V: IntoIoVal<T, L>,
> +        Self: IoCapable<L::IoType>,
> +    {
> +        let (location, value) =3D value.into_io_val();
> +
> +        self.try_write(location, value)
> +    }
> +
>      /// Generic fallible update with runtime bounds check.
>      ///
>      /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of
> @@ -559,6 +601,32 @@ fn write<T, L>(&self, location: L, value: T)
>          unsafe { self.io_write(io_value, address) }
>      }
> =20
> +    /// Generic infallible write of value bearing its location, with com=
pile-time bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Tuples carrying a location and a value can be used with this met=
hod:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_writes(io: &Mmio) {
> +    ///     // 32-bit write of value `1` at address `0x10`.
> +    ///     io.write_val((0x10, 1u32));
> +    /// }
> +    /// ```
> +    #[inline(always)]
> +    fn write_val<T, L, V>(&self, value: V)
> +    where
> +        L: IoLoc<T>,
> +        V: IntoIoVal<T, L>,
> +        Self: IoKnownSize + IoCapable<L::IoType>,
> +    {
> +        let (location, value) =3D value.into_io_val();
> +
> +        self.write(location, value)
> +    }
> +
>      /// Generic infallible update with compile-time bounds check.
>      ///
>      /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of

