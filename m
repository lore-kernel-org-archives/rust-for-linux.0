Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1A3382D3;
	Wed, 11 Mar 2026 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188797; cv=fail; b=IPSMviQPOxTWvZFpaHGpvpLTrhANhaW886I6AM9+edgv97FhRPA6O+gYcR85gLDzU23kHsPfs3n3grcg87k5NLokvlUf2U8IqXM7NqT4IDm5idOeyrjyb4e3D0HRZjXStt2zUlJIpVMOjFtZXGD6ybBMpFrOA/dkkFc5vLs+O0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188797; c=relaxed/simple;
	bh=1FE36Xi7XmkMB/LY/JHUkBBPIxMuCGrkreI9d3vDU44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fk2j+9XawpxMPEMxaK5GeGK315LfRcCsoS5oVD/Mn6pjAJ9f5whT2sn0j5VHUWaWPno2P+yucLn+qBtPRzZ7UA16EDljM4vM+w0G5KorQLvT89b8bzGKBznxGZAEHjahFXcImhv2/nYrCBFMKq8DzxlPLs/582qUpyZEcMP0/gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P9pvPOF4; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P9pvPOF4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHyoQEPGClIS/u34iJbZQ9dviPQye0NQaz5JYVxLCHIeLrlmyZrMVGYK1iQeB5LuQEPhvcSqyVubUF7TkxrGwLyajuoOKA24cmSUCoIQF4YeLdvKK0p3U9i/tbj53L9ihNImPdlOebLfjnTJ8shpTSs4Cn+zmtXAqMRCgXTNecwTkmsCQ6VQ5EonXeIc4K07hiINLD1tIZflb+1vdgRN6C8nLmAP2kwtvc4976u1fOb8yap/kZ/+rk0C3LCdcy6axmfzsKRArjPQLg2LVdehi2qtmsgj3mSVEWXIWMPp3rpVlwlwXWm3a3ICkQ8e3zE3u04OAGuSv/9esxZqnLM7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfCXeNS2IYYLqki9sTcGaSZlSqt61sTAbfeQwEz9SSk=;
 b=N4fVoI8l6/o3sLyOdzOEJAsZCcxo8jMABwzcGBVfZFG0i6RX8v0FpvvCaYC0OUdGmN8CbRgZlDPv3fuK+84A7B/nvAedyTMOxSnziyEk3rKqzECOH+nV+CutHpNyMWSh932ALD+n8NouHFDcEQTdBKSb7JsbVZ+jnBwvrmZC/nExmI+fXq76+k+vLgrMJlVzQapriTo1nICshP87xl4ZkblGC14tV5s6qfKFLdIn25QaD/quJa2OzDyuIJcmXtJtR44v6u4dI/kkpt293oEL+12YySWjXjP99BKZ2uf3/NkaWeeZKe0a/0cDXtB4P/FkVNhD58NThBcDu5cb+ikPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfCXeNS2IYYLqki9sTcGaSZlSqt61sTAbfeQwEz9SSk=;
 b=P9pvPOF4vrguYRMNohFTOTYQa2TPgqhbbQZrpN/hSpLpGrrDHO8Q7fuM+2m7IoQiPP4dRFi3io9Au3mUwgPmg6g1Y3YAD/9bzOiBZtfmlkm1IIBL0sJckzoKl/dq7e8AeS4pwsPBZPQ29TDzwroc71bRrfpZSSu/Ohh3+nHHLWnNWPoZHNRRfIGPE7o8PktYF90akrUGanVHyUFjNrJ8DRaEKTy7OiPA2wutlw1kDXBho3ddDyysC+6IvImmOb3JmXlQXR9VGF4NBHv/cZNl19rKwIY6H0g8dzfPOXcN7nTtpo8oilKESqHiM3pu/CiONnGjhJZvCFRTUi2Sk9z9vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 00:26:31 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 00:26:31 +0000
Date: Tue, 10 Mar 2026 20:26:29 -0400
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
Subject: Re: [PATCH v8 02/10] rust: num: add `shr` and `shl` methods to
 `Bounded`
Message-ID: <abC2tUHh6jEZSZt2@yury>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-2-424f80dd43bc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-register-v8-2-424f80dd43bc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:408:f5::32) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a63d4c-ed41-4079-4f21-08de7f04d803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8ct767hA6qjC2PCa1+ICWtX6tg1+DTezRbScRGETYEYfd4HvY21AQgzRHESdhyQwROv3XvL9gA6K9xWv0v/j16Tz5eYwmEETOuxWCdhWcY9zQGjcPaCjQxmJiSuYclicPUPAmSEqA9vwYwBGWzeZA/liWXwPG+zNM/Bkl2LM3z3YdB8Q7nI7qnvaJnTzcaB7AGuOcOBcQJIqUZeqLsaB83nX8QogZii8RTtsDsp7b9hZbl9qHXNJ2WAkE1M8WsCM/DFWSWgiJSgKECN03s6OFX4lfxCxK0W4jOIDSqxL66YA53sa7lkOl+XbEEToOWCGOIXleEO6OSLQvsampMEyomz+tU13OOJATyFjySY8BOOkEU7syZcb7vZOSga4PrrcmBrerdaobRWOQd/w1uBQPPmVw1x9w7CRYZi5B6Hb1opSTQT0/XsPKU16ZwFYLZFQXSAQTXbu1HMBcya8dNPVRvcfEofKvBiVcaq4fro9di25E1ElocrMg2xxQB9WdwjJsdG8HNKbKgsZAjVgrBUrS1Q3V0iu1JQoyTV2FsVLPXKILH2egHdOo77mIDhwcxTDnBG/NChwFGT49Z4UdatXR9yIu5iwOYSq9t/9pPVGMLbJHzlIrSrAQ7RYYURjd9YX/juJGhlEHfpypdOZ7FCFh1xa0I7AEZ63FCi6PmKDxbuUgGSLHgvnN6Ax2uT3+8OR7SUiEteSuhh/ou+z/M04TOvIPUXySpnM2ZGN4xyGx3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L49nmDUbZI6mGSIOdQZusIqg6lw3Khg14YEmrsyMAlTRYu2P/46QYsz9g3rY?=
 =?us-ascii?Q?1i5MYbIAXrngKjQaIGYQjwrpnQ/BISyeps8GcMUF5hb1OcSVILGKIsMPJVR8?=
 =?us-ascii?Q?phtK3NkqmbEaiVcIcnlfIsC7F4S8lpT9QR0XmJs7LMNGSM/6PUJmAhFF8tra?=
 =?us-ascii?Q?uHYAU7BGhpvQLqVTxs/xKXflw39ahkxJvMzno0Yi9D2CKxzphELXQqnOTXZK?=
 =?us-ascii?Q?8zwFg2Xxz+x6ZzvL78nDFklExxJu7sV/Sn3B3989rw6Zn08MQrSqgDNc829c?=
 =?us-ascii?Q?pnbWIZ0O4K/Ya0XZMBauzXaq7bN5TjFXy53J2coW92b7MG1BLXf5E8gAXy9S?=
 =?us-ascii?Q?X+z5cPqhY+u5nveton+zwMKrUhc8nsE4oJ/dKsZk2dqBpmE05HUHbe1gDg3f?=
 =?us-ascii?Q?FUSLk5r3XSqx2P0Tx+7DFEjXQGtgvoe+JKlHZ0/S7gLb2G8AGS1imgOc/UkG?=
 =?us-ascii?Q?JA7lA7RrtJ+aOYJ/Z+DXTLPm2p+88ChXBgetYmnoCd743ADfdquuWTiirE5I?=
 =?us-ascii?Q?1twYfoUdojF9WrRcbEkLd2ZJ7tqdhtDys6cKZ+FOegJQzRNUcKR9Zc4xMe8b?=
 =?us-ascii?Q?gvcavV2YfenjPRfB8Ffb/DEfjUaqtZPMWFssvGcTn4jKhPoA+pIAVl0c6thM?=
 =?us-ascii?Q?E5vIYlLjBkiRuFAi8UE7N2XfhPu+8HOlviA69N6qxvJPAfK6i5yc6Zm6pEHE?=
 =?us-ascii?Q?laEhJ6PAalZm+a+3q2yr36qN4GSRCtrft7ukE+V0MJYNa+DLuinfLI/Km78w?=
 =?us-ascii?Q?nlPeblLWqnsF+V1vL/0ThxRa9dyAw6ji+gT1doihbcyKO4mur+c+cCsuikVs?=
 =?us-ascii?Q?rVxxBsu13Jaabg0Zp4BR7gurYlSAmBxB6k2SqPcVo4Py96MxFVnciFc3dFI1?=
 =?us-ascii?Q?eCy/kpYNZjgRFJ2Gd8pAUJantIn0WF/GrLt1rn/FjkszJ2wxMOXKq9V+34jv?=
 =?us-ascii?Q?0/aL4t5gbLo04ETpWVox7mhPMEugHhHB4RWtYZnb6nxPwuS3ghFlsOgdL72b?=
 =?us-ascii?Q?axOVL7n1BaTsHxBonKreowMLES/JFwAiJ1UC1+Sb+BifeCfL36+TdZe5Sqjy?=
 =?us-ascii?Q?U7vsSqhPuyUB8FsqZJgNvt+J1hkEdHABDPZzfCmqQjNi5Jy3xSlCsX0S22k1?=
 =?us-ascii?Q?Y+XgMgRMOlsbXu/3/lwV/FsReuF6hFVcMKCN0vVsqehjgXHg5W73BRNiUBL6?=
 =?us-ascii?Q?z5Yf7kqFgb3N6DB3jY2jsRys88ReWamP7CWZKUvPQiHZP7jhCTOYcc+/lAm6?=
 =?us-ascii?Q?bLtIoCp9ZQaF5bj91KZThst6QuIc+AzJeXV69Z6w1EMKG1IsCWlIqhKlGU4G?=
 =?us-ascii?Q?V06ZFMeCkgG5bwq9S1p+EMHDalBp2b7kzJA9MoQNFUaMQ0Nf/lO/6T4slWXj?=
 =?us-ascii?Q?/SrtC9UhPUV8RTGFDxNFlXC+DkaAi0CFrKs25l8u5rsL+D6d2lVM4dGL52E1?=
 =?us-ascii?Q?4vA7zy6bOjeQGUeu3smgYDuytHbcj+pM+Qd3c0KDRLigstRVFHEgpwrL5MHb?=
 =?us-ascii?Q?Ix7mBhia9JcHf8bSYDIkqN3C9W8WI0rJjxhHh0jkPxxNE22XTz9R5F9VnKv6?=
 =?us-ascii?Q?a9Off12/2s1n5yz2JYUYOVxRmrMIVCvrW4ocvi2HYD6WJyOxuAcW7A7E0bNB?=
 =?us-ascii?Q?SLOHHFkhNK9z4Dp+1vBcf3+q74UA5Xqe+YcTA0gTQcQyKA5g36K7Y7TmakMN?=
 =?us-ascii?Q?3jAuIbYGTwe8TBTlmOlOs0N2seZGhQNzzDLh4VnV7YOSMHPTEMm5KfLV1eWX?=
 =?us-ascii?Q?UGKBs8I4VVZng84T8lANNCWNXVoqAop0PEidDWLeh6R5bMTLSd12?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a63d4c-ed41-4079-4f21-08de7f04d803
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 00:26:31.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wY7sOcwTvNANi1HCWLduHB8e4oMmrwFMIsd9SXs2wh2v8R5SU9aMy/tvVpgeF+P25zeOMmQ3IY+VFCIvuh6b1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853

On Tue, Mar 10, 2026 at 12:13:59AM +0900, Alexandre Courbot wrote:
> Shifting a `Bounded` left or right changes the number of bits required
> to represent the value. Add methods that perform the shift and return a
> `Bounded` with the appropriately adjusted bit width.
> 
> These methods are particularly useful for bitfield extraction.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Yury Norov <ynorov@nvidia.com>

> ---
>  rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index fa81acbdc8c2..2f5f13ecd3d6 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -473,6 +473,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
>          // `N` bits, and with the same signedness.
>          unsafe { Bounded::__new(value) }
>      }
> +
> +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
> +    /// N - SHIFT`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v = Bounded::<u32, 16>::new::<0xff00>();
> +    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff);
> +    /// ```
> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
> +        const { assert!(RES + SHIFT >= N) }
> +
> +        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
> +        // represent the shifted value by as much, and just asserted that `RES >= N - SHIFT`.
> +        unsafe { Bounded::__new(self.0 >> SHIFT) }
> +    }
> +
> +    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
> +    /// N + SHIFT`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v = Bounded::<u32, 8>::new::<0xff>();
> +    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff00);
> +    /// ```
> +    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
> +        const { assert!(RES >= N + SHIFT) }
> +
> +        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
> +        // represent the shifted value by as much, and just asserted that `RES >= N + SHIFT`.
> +        unsafe { Bounded::__new(self.0 << SHIFT) }
> +    }
>  }
>  
>  impl<T, const N: u32> Deref for Bounded<T, N>
> 
> -- 
> 2.53.0
