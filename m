Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1401A6814;
	Wed, 11 Mar 2026 00:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188984; cv=fail; b=ENyBT78Nx7O3Q79/5A+tTdhzxVfI12YsXl66QWdSpBCcIbE3rO7oE68xJu4exH7tid3EDM2jmkNe/OmcaIdMMXWUbeM+ReYO264syq2dJ3RTcR/SACNFsnDzyBmFB8HfzHoqdthVYOxqVR/QmG2MFPkiQgRR4ZBEwiGup/LML/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188984; c=relaxed/simple;
	bh=bn3rY7V5cCOTAVjxPnNgDHandj0e0pcPpj4qIHwKMc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qcgSToJy6f/hlNjxRtyLIGlBROsY4+JbNJTZ7nz5p6eqDnzwC3+bHFDRlIHj0n00hPBXWa3nHaUDM8pAcPF4cw1ny/B5aGYD/ziMRlPLnmqFTG6htIzoqouZSLW412lPkKHgRDIlErvQ/qzi3cJ9V6YVlqIm68sAl4rVQ8xbqp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mRIBo49G; arc=fail smtp.client-ip=52.101.46.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mRIBo49G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vk63auNDbOri09P9xgU12RfK5xMQmTtNAV+Lg9FtUfJUXfYZWPKMaDHNQFXMGDqsS4SnQUAOCBzLjJeNWwJcyLi0zTr660402NhV66qUknVw2d26ebJJKrG2EZWPW/akitqccHXhqJgURtqjW1RIR4KhT6c5trNCy8qH6d4NGfAEOyGheo+fREas21Hy3LZfjLZGlSGhJsEX2mSPWZ/KxPvKy3iDQzjQQ4BRviy6zTAevhrGZ8V9A7wjdGmmUSC9sLN6gtG6LZ9jPa7JCKhShOu35yJqzGAiJv7aiQcuuxUhmbuVMs17o6fFrz/qqYsH3pHGEapr8bkJdViazsXskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhZXDyF83AckjhJWY/tXPNpgkNI7kKm0nS3B3oTxgxM=;
 b=iqZFtbR7G1r1OfxEJZfils+bsB7nPvyf6djrqHb5ltrEqFmOQPU9BKsr/cPEwNjxPSreUYNDQOB91Y5ySNjdo1pu85HbQaB9htZXZSpJQN9DNtKhMl+H4BLkm/v2cmgv3fSX/Q//Lg0p3SVlczeIPKynfZQ4SfAx6N9m/89/bJFi4UVIo9s96FhTGNzvqLVH2ud6EbRCv14lNsvSpBtkhay1s2iVjmE1FmdNx2bVrWgWGURULHpYJd12xYmrFrW8uM1lammGvDCirJZ+D2OzBT+Z6e9SHcCvKTq3e6bQAtT+alKJmx0NZyFBF9NTYmXjkoPBxnIgp3XfqnZL96Lj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhZXDyF83AckjhJWY/tXPNpgkNI7kKm0nS3B3oTxgxM=;
 b=mRIBo49GWdDZb3vKpYwTEbMVYXyl8ICvTBFPluVjVHM/0+QZHoNn3IuYaMjmZeiDuC1heZZWPaimT5pyEpk2/SCd9kSbt/6z11dALtd0bCtCc8gkecLVBmTLbp6eXoPpuAjhB03o5xew7PHGnmX9YuoAv3l0qmnBXUUpXsyV5tbFmWvcFK+YH13XGbTqf7KevewYiA376/rX/gfgBboLbvOK+UGA41Qnoqt1sZsrL8g4IXiR/nNucUa3CDeXDCKT8radf3Ew9/2Mxz2861mUVUO4xSdn727ab9M8WIuEUEKgj9ZjkbMVazvtbZSEYzgM5Q1wXvS88C8Eti3YkE6mBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 00:29:40 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 00:29:40 +0000
Date: Tue, 10 Mar 2026 20:29:38 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 03/10] rust: num: add `into_bool` method to `Bounded`
Message-ID: <abC3ck7nCeQdP140@yury>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-3-424f80dd43bc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-register-v8-3-424f80dd43bc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0616.namprd03.prod.outlook.com
 (2603:10b6:408:106::21) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd72614-8334-4c73-5f1b-08de7f05485e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	32FurSatPu3Q7Xb6aItLux6ogLg7jSALTbJqKaKl7J+Kg/bw18YNFcW6hIKnrS59wrZfugL3iCqkwqiZ7usb6sAd8JaY4QfpMee7sp1h77GiCF3CDvsACTWmPwQueLcVgZDDaPNxpS/yUm5d+lT6tpbqtJ6Tn4OTYjC3sekvP0Kkks6nOdQyuZIApq+XZXMjQf9qmNTT26hQ2kJJ/BNRSOPLgThQNewe4Xxi98vLbyatC+x94JpJ2p1dJxrJ0ATcYGSaK3tib77h+rmhKNvNqa31xuUyHMD8wyis60hcQT8BVGr4JsLiAlkplQ7apmM6GY99QL+amT6Z0yBaWcp2spvoY0Fyo7Fbh/6mBkhH0fCDP+V55iIJbdJklQHuXLcCFAWjfmcjYsJ8+0EJd8pcwT84TxWR+perROuzvb0qfpFjOdQSXVaJc++gfBksg8FNYo8kAbkWLNAIslpv3ZkPztcTF5MSgP55d8OLg+OOz0rQFC0l3XKnXaF5zW0qJ3dx9rZqMaUwJkG7AKyu+wbYJJezwaoPtzD/CpzDW+wA3eaoWiuolG5jhgW5eyal2iMjr3kq0Gw19a5NDBEBQtls0gusaact2jye50UEjDpiamo0oxNxC8S9JAOIuN3KtI6UHGXTs/2cAtEwugc5jSaHQIQ8reH54aLScKcZCbh4OemRqIZhfUmTwDSvYYU8/umlAxAdXe0WaIWJK8mwt9InQFQBwY2SDvpboiSG5RPavDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?svqvvSpsZllG71UYhLvSKBHyEy6SUeTbJWOeD6D6tW5Rln8c9UJTumlfVPiD?=
 =?us-ascii?Q?ou0b8f1OCkzh/E7MQ7IVttqYcKDJ7MKg8/rFjPrDnrt5XNgQPqDLgIQF9rA7?=
 =?us-ascii?Q?wVLiP+fg13B4WLe0mdAklH61ocOYvKFsP28fxx7DgGfQZ79uHi1+tBSuESSg?=
 =?us-ascii?Q?/mn6lIX0zJkDkKlWS0Ix3Ye5fbQT4wuVVSzznLQAaYX2RFrlNEU0e+3Hbmu+?=
 =?us-ascii?Q?Pq5ugCo/Mh1p2d/qE3hS7JqxhYAkXbpO4n2fEoWxRHFt8bEksNNRRlq9LFK2?=
 =?us-ascii?Q?o7HnP9wLHj0jh5jTDTwhOf0AgQvTzGu6PgZqv/AzgUvxvEXZcciAyBA32BcJ?=
 =?us-ascii?Q?agQ9ZKRegNabN7ifU5FRtnSdJpTvPceXVPPX3beavsXpsQ6cd4SNnkjDOj2j?=
 =?us-ascii?Q?+I2ICHw1pxOq648imcbCUbBrP+mcr4d5ddyhYCf0lZjczDxIdzHadya9FX89?=
 =?us-ascii?Q?jpyjrSWLHZURdevgH/c3mfy+3W2zYUgpg5W3A0DEHwkpQUnoyeDMbqaPYiAV?=
 =?us-ascii?Q?F+p5qS8D9TTQOsKrN0wk+asUbvpy1c+U8BwTl05OGV1M7lVvsIG2odN6ugvU?=
 =?us-ascii?Q?TEhloKHTxWh8rdEH7BAGh6GcLQ2GVIg718GLRGNO8dofMrT67Rm2YfQWCKzL?=
 =?us-ascii?Q?eTyrJBBbPkaP3EqvqPq77M/kYYAH/QIB/Xo5wBrtxVIdj0n5neXjYaQS2w+p?=
 =?us-ascii?Q?74q6EzvyQP++Ayx7kiy0dhNl/93f2tqRchwBHYeKxH/cDoVhXnKQ5L31gGBR?=
 =?us-ascii?Q?Mf4LCkkzfyVoCzOZTev4Yys7l2lU2b4/9OJHj0zOWJ76R9oXDvhqbdZ+4UGE?=
 =?us-ascii?Q?zQim1k/UknLHZZJj6IHZQPNBLBBs6JZehjsiu51e4xlvPw9yJuRc7Z+8M+Ip?=
 =?us-ascii?Q?Wfhdyln2f33Ehmam18RUV4kkRiDkVt1QK6B6MZ2xKRL6u1h0r9Ar8ycXBfV1?=
 =?us-ascii?Q?hgcfiO7lSE3recPgRUKPaN+0VpEPYGamfQyoZmP+ij/a3tImZEJ2DQ8SBC5V?=
 =?us-ascii?Q?P3uLsvmzlopjb9d8JsgbgJ8PH31q28V8ahl9sVv3rKUMr/bbK8rAaBe1bgqt?=
 =?us-ascii?Q?TiS+Y97A9Hu57Npt/Nkn8IIGFves9YAz1i+URhjBbN0Sr3NOFiFdXsqFLIT4?=
 =?us-ascii?Q?zbRqWhkI1+I8tz0cIwEGhbWZydr0mjN3pPEuxxF9O6wkuszIB8oRHnEb+8t2?=
 =?us-ascii?Q?cA06g/9oTjBxKYHp5YHrxmV8REpw1j+oWD259zsfMMcNiIr2y4Pr57qQH3iQ?=
 =?us-ascii?Q?yp2Vl2LMx8zchNQd6FKIyg/yAWKarKXmp2i5vixKOw4sSH5w9PJNZYg2u9p6?=
 =?us-ascii?Q?0vsH1tr3e9eqpDXXY1xab1ZAyi7O58kDymqA9rBzUC/oKtz6TVF7xsjPQ0+O?=
 =?us-ascii?Q?xB1bshHy0gfCv7dvVsmrp2K7ZIShkuAWLA0x89qAd0CesfWdP6IdvZW8/I/D?=
 =?us-ascii?Q?wKl9QLozY+wiylJRU3HEe/SRQrzg/tp5T+h3Efis/zu6Ue5q4fMl/Zt4lCPj?=
 =?us-ascii?Q?gYg9kwlrPPQBWUndmj6Tubnq9ShmlWk7XpGkWcnOMtViNSsN1lGw+oolpBoz?=
 =?us-ascii?Q?NMgVEIG6F65QljttX+L5LWS+vpB1keIplRUCMVTXHxegb7Y++cn4rIqvD8YV?=
 =?us-ascii?Q?BYbXIwjIt/KYXD9iasnz4yjbbJpL2kZ6rheD7Zd51544ZRqlK0wFopAG+aFU?=
 =?us-ascii?Q?R8fPagwkl7y7u3laancIcRlmJqbdg1mwkGlojb43iqhX85shYdrPq8ZqlFZ7?=
 =?us-ascii?Q?23P1eoRkl2w2puPJQoIOhVA+t1U1Fuh2cuT+GQniJol3Rx+4GcVE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd72614-8334-4c73-5f1b-08de7f05485e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 00:29:40.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ca8twJI38bd1U4oJ/MwC5boMMcN0UmLvfT+bwB/yzMmrrUsqzI0s2vkFEvtBYJioA3cEdalNOaogH0BB67JyKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853

On Tue, Mar 10, 2026 at 12:14:00AM +0900, Alexandre Courbot wrote:
> Single-bit numbers are typically treated as booleans. There is an
> `Into<bool>` implementation for those, but invoking it from contexts
> that lack type expectations is not always convenient.
> 
> Add an `into_bool` method as a simpler shortcut.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Yury Norov <yury.norov@gmail.com>

> ---
>  rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index 2f5f13ecd3d6..d28d118abd8e 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -1101,3 +1101,24 @@ fn from(value: bool) -> Self {
>          unsafe { Self::__new(T::from(value)) }
>      }
>  }
> +
> +impl<T> Bounded<T, 1>
> +where
> +    T: Integer + Zeroable,
> +{
> +    /// Converts this [`Bounded`] into a [`bool`].
> +    ///
> +    /// This is a shorter way of writing `bool::from(self)`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// assert_eq!(Bounded::<u8, 1>::new::<0>().into_bool(), false);
> +    /// assert_eq!(Bounded::<u8, 1>::new::<1>().into_bool(), true);
> +    /// ```
> +    pub fn into_bool(self) -> bool {
> +        self.into()
> +    }
> +}
> 
> -- 
> 2.53.0
