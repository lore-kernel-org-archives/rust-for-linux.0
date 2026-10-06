Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495E949F105;
	Tue,  6 Oct 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303435; cv=fail; b=hns/gTx28jwrcipKVUvSZmJZDUZpMNWKDa74MXPacemvSUnB6nZpMPkGolDile+ByrpMvTpe8QRG0Fje5eTnoMRWn/BlsK5NIQ18+ZmjzXPCJeI+n2w0+pfLGpCPnD/wRLxugLnbQKMDC6SGePu+mEVEXaXwlOFc2yLoYIDGb/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303435; c=relaxed/simple;
	bh=qYdUqINX0uzLg3I2mqUfMy+VJnuarivIjrAea5F6peM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LZND5JMjmVD+ufoP1S58+8yYs6pNg/7/IqopNETXODHMUHPmlY3PKKISXt8DLqL+W2kwmpzyb0H1xIUEeVkomRDxNDLwzwtTrlpHi/+8AHhtdzbvcBVcWuXe3ur9lMPP3OSz2fK1JMiJ93YiVq3nSKGuoGCC8PriKw7N+UYA6T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gb4OF7rx; arc=fail smtp.client-ip=52.101.48.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gb4OF7rx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4OUk99B6CrykWYOSwdKBYK6lEZ2PUwiHm4HYlSLU44FUFVqZAxh7pq9dw1K4+icSoYOUWsFUTJoGrUcRW7rNyDeQkLgYbIN9fZrpQLBRnBuKFcBbQIhz9NRHX6ULJESDZDh1LaG/yVjG5Gm+SWeRbenvHAgN2DfIuMX+uHaNZ/go/Rw8EiPyKQu9WNF1lyuaMGlgDXiXEFFbQhp1zsjyPz6rB2l7HaOia8wtimrXv22mf++4G/0Fk7+m6xae4UMGb5lLDqOGppVEKbzSqar+bCkZeWtlKZjbj0vCEVvFiEqepybYkLwNY/6QcWgR3V+VSKpzjrBXAfCr2elZ4Y4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxUALd5G4Ij+v/nSYKX4JmksiQRQm9H5DyyIlBw3UcE=;
 b=XuM71lpWS+f+ovrhRhY3qSuwkR0oY812TVFsWZUbfArhp0losaR7ptwwL4tHGgunq22MoxYMlQjfDg7Yx5A3lfYktzAm2xSl738pyTiAqPbgL6JNWt9Xic19O8kJ40qLaZsWDGTNFKjRURwhz9/uQwRFcDGpP8hJHg7oJJmR73JDhdK5X73FPqx4yrvltkm44VLnKHL58eMCPAgsiXC87iwigg7Zzf3PA80bvzQ1G23teCICQn66tvOpiJK2DjlAbaKKYRdngSD7yu5tPF8seG4CE3hFzouJQ2YqyyE9jGiocEj6ylAJNJ0NFT/pLjbSJB+a8lvr/4quZlvCRDkl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxUALd5G4Ij+v/nSYKX4JmksiQRQm9H5DyyIlBw3UcE=;
 b=Gb4OF7rxnq0l07tFKIdhpA/qRyfdY0dXQDyHJ7GiX9xlwi3wok7Lx3v84rAHqB3bx4a9cVLc72ATfl3kFGT3zm/ou6iheYyKsxfbrBDlsiNArNSGz/lSWVvj+zEkMjCokKx6XaKXLsOm1gs7UP/tKToFwd1Kb1+51t+cLI8mIAGVO9y+aH6yZHEqhUpW8xDMZX9VbOfHPW7X5WBzxmw/p/DXyUut4EoG9mcaq1sl3ILxK4JaloOLo3scvQer3SbymTNfkAaPV8UaDQUxnb60Mac0H22nuRykxP5hZzNtHvrXPG1gYAmfdbhzLMOkpj6e0xJlcrv96v4wr/2Sr2j5zw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Tue, 6 Oct
 2026 16:17:01 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.026; Tue, 6 Oct 2026
 16:17:01 +0000
Date: Tue, 6 Oct 2026 12:16:59 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Eliot Courtney <ecourtney@nvidia.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: id_pool: document panics in `find_unused_id`
 and `release_id`
Message-ID: <asUe-3wpbPA9TgN9@yury>
References: <20260908203157.1271219-1-georgeandrout13@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908203157.1271219-1-georgeandrout13@gmail.com>
X-ClientProxiedBy: BL1PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::35) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 698b1193-8965-488e-927e-08df23c54091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|10070799003|1800799024|366016|376014|10067099003|11063799006|4133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QaHyqp1DUIkK1nvYMgKjaf8IFXLtPyQa+MmydMUQXfrovQ99WniV0wY0kkcM8WFikWwA9NfOLllfJNJczk3Yii/izS9cx3ec8EthcbM39o3bqGlYF7FeEOK7wWbIi75vGfpvvUU4g0CYybVHlfXW+7ZlmtoqviEHr3k9zVZB804h1308qDjkDhC7izJnCXcVCufjjC0dGwOfj2T3LBbZ0EoVTzTUGpUJZ5+WFIySz7KdK4YcAcMv3vbXAXQ85mHsQW6bH6pKMFqbriU7fxOfNdY3b68lRzJielaHZ/Bi53Afw5e5hq53d1P/kAVA3aXtAItkYauXtXeHEgN4KjPEiOs0SZ7fDufKZHHYSF38xo2O1G1Hs3rt1N3nuR/VXBwM3tn6BlHeU5raJdpGT6j/BSQR5KDfudngIE4FBPLhw5t6pjCgBLfgaJ85urjZF+sj/xIsF1leCVugsL0ngFzw+nH1zWxVm7DQq3D/4jKrP6u93fZ9MfhCagj9kqUQwLMQ39GT48Zph0tuY/yQpoKk7wbMAsgpWXKFD32OVmSFkSLxfSXiZKRfpkKZlFTG7T5u7DJL/6ugYrr+O8rBd0aTDLc9c4nzirwm7sW55qod4HqRgHk1oyBNNqnLfb5PQK2zqZfoR8tWGezEc5teHyZROjHAJTGpWxDGqHbn7JTy654=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(10070799003)(1800799024)(366016)(376014)(10067099003)(11063799006)(4133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Zs+L250fwzwtBUUPfKdiUPNlxUukleYoRPzIZgFawfpPZyqNVqqRnNnuyEu?=
 =?us-ascii?Q?D4bT7SUxliMLg4ZoM/M9MSZCM3Mj+g9VLpRtAHvWe2nl1smVSIyVrGp/5J1e?=
 =?us-ascii?Q?1ne6PPgh0OSlfE5gKubPeVHYbBVB2t/rBJqkpeqP54l30OH4YouvccgRkvHE?=
 =?us-ascii?Q?rdFRhLmrNC2q9qZGAQ88q6x3RQlLLFsZskNaPGHmOnSAiIYGnRdDrtrto+BR?=
 =?us-ascii?Q?4yZ+uSJFsU4q4gt69TXwQaIG6cr0dtRFtw1E/XlcWcWTyVNE67REnrRxeonD?=
 =?us-ascii?Q?UvQYdYpsW0vvTQpMki+e7CsemjF6Y20jnKAXOGPizXSQCR1BsgCXbaI3Lvdq?=
 =?us-ascii?Q?Wq+zpe9d858sSRs7OgXa3XD7Ki2b6xHOKLXZtBGWop5LoFVcYewgWF5TOq77?=
 =?us-ascii?Q?U+O2tqKrOwqSadaNpWDm1ooIYzPHEVelwp6A3JXKY0FoImDdVcNheiTbhIQD?=
 =?us-ascii?Q?ke7kEeRpjglaqErmyjCqSeQGFnwM+wNJGOMZdT7p/zOopymmyymsMJH8JBUD?=
 =?us-ascii?Q?j5PzJ6hKaAqhsUtAAi1riNuiZdlWLw3WWfYcEIhDSd8uhmPv5C5ewJqC/KwP?=
 =?us-ascii?Q?ylNX0gT5m73mIwKn7E81Js9iu31VyX4Ke0IfgM6i0pBVuDfS0MWCqyiy/yMA?=
 =?us-ascii?Q?Q3Xy/QiyCBFyWe22MHeTMIOE4RxGtkq+Yuli4MvfEw45x6/k96FYrBsyy2q+?=
 =?us-ascii?Q?Vb20AZ8r8NkJXjlxg0qotjESgKnLW6nDje3hTUyTtWnzpI55kYm9yk/38/TY?=
 =?us-ascii?Q?Zwo9TEv1UNPJRn38SydS8J+ivndWeVqJHyZucekGCDf++Z/DVkY+whR7YZsz?=
 =?us-ascii?Q?HlbX7/kf9lCR8CtbmqoM3uYKkMKtZGWAIZnZLYA9bND5C5KOdSM7B5TftzdW?=
 =?us-ascii?Q?ERcCZIJWtHitAaYRUrhEbOiifsnFi3K7XgYHeSiK5bdRG9ZMgSNtScoHSYjQ?=
 =?us-ascii?Q?6KAUEFiygNETPrlMN190amVePaUG+oHbtw7OUKs9fmymQyQ3Nx1mEOlBEKR1?=
 =?us-ascii?Q?w31VxcLe7MJl7XGjQsfsyaTJjjepO3HvNClLID+5Jo43NYb83nws0qlAmqrP?=
 =?us-ascii?Q?lY2KXziRdVX648oQqLb7jivflfox8oqAIBLce/4qx3VWL1dnCQBK/FBKtnpd?=
 =?us-ascii?Q?/yz9qf+chqXgXtxSgrd7nUgG3XTdcwEJxR5mBBt1+Ot024GWgqdhxgfgYWMT?=
 =?us-ascii?Q?OZGEBhGER2/HcYdQiK3dhzYTLDEwD0sJLPGzk44uMcz5j0OPiGF4jo1fbwNW?=
 =?us-ascii?Q?CWUx4enirpSX1G4LyGsrcdYMLoqRupYH7EBP/358F5vkQ2Wm4dfX+4joXBtF?=
 =?us-ascii?Q?UvB2uVQKtuS1gxjlCBSrKAyfzmoOwjUSE4+/XJToUJ40Ms5hFeX87nCQ5n02?=
 =?us-ascii?Q?N57isapIFN4VSGDGJ2677OSnDPQfXCCXq2r017Z0ohGYJMTJw1hiGFXoe0N8?=
 =?us-ascii?Q?thlYcRMkGYwfHnqTMGjmyMHpykgtcz//1MY53SetKBhvoRuqC7DwznJFEwF2?=
 =?us-ascii?Q?sS2WRUH8KIXxTtb7zYCIK3SrwNkzQirOY9FKB/XhFXdkxSS1bnIVgHzpVg0C?=
 =?us-ascii?Q?+L9KpTZQg1Lg+EZ6KOyVr55KKZUXgVNBHEOSMWpmANrI7idMwJ1XzTrgVTLm?=
 =?us-ascii?Q?4fKlt7vtn8gr7mh5yUuIPWDjTkY0RXkbQOX7mmKYZOim8ogUM1WQkOtynL+o?=
 =?us-ascii?Q?LVJRC/5SKyyT6CfgTnHe+WsUcYL0QV2MUswQyaO0dKTiGRMjBON5/IZcJ0zC?=
 =?us-ascii?Q?VT9h3zgReKAf4ICv/elhfWC3rzx5n0R0darjNKut645ICY+VWGB3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698b1193-8965-488e-927e-08df23c54091
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 16:17:01.0345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzRJXfpxHz6t5yuZGCtKDa2E73KGtpRQS9GiJiCpzkvOWlq7yZA+tfYddmqnKQ948pY6DWRTigPvmjvreiyAsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211

On Tue, Sep 08, 2026 at 04:31:57PM -0400, Georgios Androutsopoulos wrote:
> `find_unused_id()` calls `Bitmap::next_zero_bit()` and `release_id()`
> calls `Bitmap::clear_bit()`, both of which panic when
> `CONFIG_RUST_BITMAP_HARDENED` is enabled and the index is out of
> bounds. Neither `IdPool` method documents this.
> 
> Add the missing `# Panics` sections and state the bounds requirement
> on `offset` and `id`.
> 
> Fixes: 2cdae413cd3e ("rust: add dynamic ID pool abstraction for bitmap")
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

Applied both in bitmap-for-next. Thanks!

> ---
> Changes in v2:
> - Use "within bounds" instead of "in bounds", following feedback from
>   Alexandre Courbot.
> - Add Fixes:, treating the documentation hole as a bug [1].
> - Link to v1: https://lore.kernel.org/rust-for-linux/20260829153442.20799-1-georgeandrout13@gmail.com/
> 
> [1] https://lore.kernel.org/rust-for-linux/CANiq72mgZg-QBy4gwzHmD4gJm4wScktfpdDtyZt3Zijk83h2CA@mail.gmail.com/
> ---
>  rust/kernel/id_pool.rs | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 384753fe0e44..ae6960d7f638 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -224,7 +224,13 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
>      /// Finds an unused ID in the bitmap.
>      ///
>      /// Upon success, returns its index. Otherwise, returns [`None`]
> -    /// to indicate that a [`Self::grow_request`] is needed.
> +    /// to indicate that a [`Self::grow_request`] is needed. `offset` must be
> +    /// within bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `offset` is out
> +    /// of bounds.
>      #[inline]
>      #[must_use]
>      pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>> {
> @@ -236,6 +242,13 @@ pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>> {
>      }
> 
>      /// Releases an ID.
> +    ///
> +    /// The `id` must be within bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `id` is out of
> +    /// bounds.
>      #[inline]
>      pub fn release_id(&mut self, id: usize) {
>          self.map.clear_bit(id);
> 
> base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> --
> 2.47.3
