Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767E3988ED;
	Wed,  4 Mar 2026 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625428; cv=fail; b=oLLhBQUu4IoAVZLN5pVjCfZyLXKj+F3nAdAYlXbbd9RCsFdEahnDRQWrHxpsRZbm8T23frUzTK45AmV+HbUSczeVG08YAxw8vBfKkNRn/JPDTslNyAYqMQk1QkToES66UnJfZ7EujtNrtmO3RNie8BDWFQ8ozUlZH6ovyhptrl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625428; c=relaxed/simple;
	bh=cxam3LaaUpNre0fM9vAeqctvECTe6ihUTcMR4jwCxzw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pEGFPhW3pFVdcdqvIYliA2PuWo62m9TIACdFUkbZv+DLpKgkGDYwGEDs9jZeL46foPjB9O3U2g96pIO0x5+6zWKapfHRsYDnIbHRomX+uHnngN8p75A/0PJinD4x9bwVz5/pAi53Hxd8g2aoTN6FIPDDP11SsqTDey+0Y0wL/wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pwM0dB8W; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pwM0dB8W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCQERQnep366JNt+JedM2RTKbny2Zo5h8R0wPEGzC4in/PrHZdHsp6uAxDzT0eiB/Qku8yLNVrHI+rZdAcWVBIVOn8EjQjbfya+7Harixy5U3LFuoiZs4OpIOcj2vi1b/4ZxGPzsZVhntfVfznh/koFZsvN42Ph9CgMy+H+TEc8aDQtMHoq5su16D8PsmJ55mVxxl6JrxzY9xfKrssW9KrJee8pjVrWglJfF+2BIKJVI1yeWwbdBOzZNnK7oAD6wS3RCtVRLMpX8gaCkEHJA6RwvjwMWB5uQIKccrtqOTUW3guDqNu48TGYiPC2OHu+W4zDTTu5YMMMmfOeCmTW94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8xrIctpXctfudDUi5HFSSsIeFUB6TDYYFPm10OR0O0=;
 b=iI7GXQCbS3x/7twIWFagW0H/8mggsB4b8ByAdcR+iJeraKoykJX4Nx2wkIXjk1O8Nwj4A4zsfYRqEQ9/oabGhuYc2P6SzfRG93H3YC82D6Onf8/3/k3K1PE8R+0Y9/6fx0RdlLkm7G0sffqsm04D9Dhxcz4bmXk6pJZMkhXpTLwT0li8XfygW7h+kq602MQ9tv3p9WdcrR2R00KRZhdyaUigbRKEHRp6IZglZRG2IbK0gyAgkqYY60jfGi3G1H41kbh/A9yXL+FEq2PHAWUXQQMtoY4cN1W1VAJn39g+zfiXxvgt9ZYH78kN2nYM6kztrKQiZlu+WscFD0Qu+y3fiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8xrIctpXctfudDUi5HFSSsIeFUB6TDYYFPm10OR0O0=;
 b=pwM0dB8WheSQXyPVc3yG44Eat0VdtLOPHnnKKTUSyKvt2p+lAMCIHRGTSxruKLV2ZdlRLlPgdedgGWDWHSBIWsi7LbRiW4GDZCEMYT6kLWU5PqNR7+9tCRk51tlO4T5PKDALSE4BPPN34mLroc5heqfeXpbeogAJDPpffmSkr5A0fGw6eDAxawHmp1+DJOE6wVwfUe1dIeiipeHn9Vsl3SANGUE/V7Rj1z1ZBHRmYckJT3IiVdKhp3wpnuOH10CTiyPwODiaxjC5vzDPSPLSSFnUmCkN3YwIaugDb+ZWF3cDbmk/778QlBJcPVvY5IDs+nFuAZcj01xTVDp3F5ZuOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 11:57:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:57:02 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:56:59 +0900
Message-Id: <DGTZ9NLS9TPM.2NRF5C9VN2B7C@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: d178b690-92fe-49ef-51c1-08de79e5260f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	F3/3KjHs9zlp4ZNN+GiG3SyA8DCxltjHNw5r1HseeBs/uThtJeOiHaSl7zXUkTE5IcHVfkbp8GW7XIthw7HgfTwa0syYcr1gA0srM3D+ZBdPTgnykSjh40/JFq7hRB3Cy3hDJ5W3JVyxK+bD1y2w1q+TFz2AjkM4XBWckTj8mlA5OrpqElIvqLpndpQDn8xEH1wTMcxpHeWWpxR9yONIFUEYepli3A+F/uCOAtGtr5Yy1m3WwOQj9HQb4/chDCTVgL92TTYg3nE/98OQGuD8WXzR6zVXL9PL6LfHNof2amZehYobyFO/hpT35UlGDd7Sw0l+tIUNZWa0JN5oH0rz8EIMkMyEy6xn3jeGhlDfbzEsiDm1H4jitgN7dRMRC/9zQNm2cESVhbIlBtMcifTIGGq2e7CFDAuCrDil68yUJAglylYNlhMMjbC9voD2YRt9T0W6slsohiOsylOdM5sgIuRxlp2dhShpfXgsBA1M7dzSaRZy0ffEXaEZuBDu8ORjCvNR8DxWFRpYiSy8uAJjqy3LnQqBJGPfGoT1Wzj4pV7Z86qRWaJVlMor/m8m5Qvji4V72SabfKqQX26A9CAV2YLMRRKvW7B4u1oS+Qbscr2L+I0GQ0Jmnr1QuJDb3rmSI0Fskjnjwv25oIu+CRBZkkOlUwbZNlgqxIQkv2gbUkoMVUPjszUO8RcNNl4KVjsizbl9SXRyIVfYlFN7zY/wUagZbtIYTqQRAu5lVw4gmFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkhYQ3JxclhGd3VMS0ZTTnpiVjczd2JjQ1U2SlE4Q21mQWtNM0YwbDY3ZXhM?=
 =?utf-8?B?K1gyZTBxNWJrTE51MWRKQnN0UENBZTJvOExqZHVpL0l3Mm5ZMElNckFEdjlS?=
 =?utf-8?B?b3BtV0VJZmxJbkxTa29qUXNubWsxYTZqSndBSW1UNlNTdi9UcWhNVk5WQlpm?=
 =?utf-8?B?aHU5QTJxTWNXWXdiZVN5ckFPOEdQN3ZOcTVUUlczRDZQaE02THFndGRDWjhm?=
 =?utf-8?B?VUhYR1FuRzdvK05mSGtXem1zV3dyVkNTejJNNlYwVU1nc2JaY0UwejFKbHdW?=
 =?utf-8?B?TGVWRmtuOFV2YXZQeTc4QlkvSDZsYmQreXBPZk9oUkxaSWhnRDd5NnpWOHZB?=
 =?utf-8?B?Z2wwK3k3NWFYa2RSaEZSNWw0NFZROXBFSHExVUxpOXNQQTIxMFp3ektxalhD?=
 =?utf-8?B?VWMwWnIrRFRadjZlZnE1NkFzenFldmJsb2ZRb2RlSnFqUFdyVkI5bm5ZRU5x?=
 =?utf-8?B?djVMZVlRNnl2RW4zV1djeFB2OUhvalNHRzJyTnppOEFmNS9Gang2eU1YLzVV?=
 =?utf-8?B?RlpCUG1QQ2RNbzlydWUvVG8xcFpqSTltMzduREpVY2wzZDFsV2JWUUkxcHVr?=
 =?utf-8?B?bEVMWTd0czZUbDhLaEgzazJXQzVoYTVoUGZRRFNKM3l2dmFZZDBoZm5qQnBQ?=
 =?utf-8?B?OTZpdE13dG1lUTlEWVFCdGpWSXI0djJNeXU2cTRUZDRCNFp5cytKKzN0cUJM?=
 =?utf-8?B?UlRsdEtsZE9PTlR6ZUZMSGNqRjdOQ2hCbEp6OUJ0SWlIOEZ1YXRQTjJWT2pR?=
 =?utf-8?B?enQ3dk5BSFJPQVdGVEEyUGd6WjliVEVvNjJPL2pZWEFxS0U0cVBzZnh4dExL?=
 =?utf-8?B?VlBVVG94b2Jqc1JRNDMySWF6d0lCSkZyb0ZZMXBCdWxHVDk5RjlicDNNOVRK?=
 =?utf-8?B?N2I5YWI2QzFHNzRxRHlhM3UrRW1vcWpBcW81RUo0Vm8xR3Q5cUhTbXlLelY2?=
 =?utf-8?B?dExmdVN4WEFRN2hoeFB0SGI4MFc5aS9CSjFPMk5HbyszV3NzcnZ0bjkvU1BD?=
 =?utf-8?B?eFBnQzJKci9xazQvZm9rM0w2SW5STlR3RjRJN0Z6Y0NUOEwwNGxpMUkralpT?=
 =?utf-8?B?RDRJTmkzQ2huYnVNeTUwMkl2VjQxSFUyNFVEZUZqdnRPbkdVVVB5OWdaOVYr?=
 =?utf-8?B?R3JWRUdJMUlTTWQzN1U2OXdHbERkMzFsWGhwbzA3WXdhZmh4OE9YdlJRdjFD?=
 =?utf-8?B?dlozSmhSZy81STZmd25pWUJnNzJoWldtQlJKeWJZS0cwQ0NqM3lNaStNVkRi?=
 =?utf-8?B?Wi9VR1RtcVZBOGxmUGVQUUVySUdoeDZ3aEZjRkRhS0JaNFZuSU84bU14VVN6?=
 =?utf-8?B?ZUlScXc0S1hYTmVoQnVuYXZWb1ZsZ0xuOTNaRkZNR0JwYktpUmdLdnN2Z3pU?=
 =?utf-8?B?bTRGVnlaZFc3bjJCSExJTEE4YnBycWExOVFEd0tFMGxJRXFSamNBbWlVYkxW?=
 =?utf-8?B?NGxnYXRPb1lDV3FPbGFiZzFVZGVQUlJlZUovZFFoNmRKRDhZSDRIMUw0SkpG?=
 =?utf-8?B?TmRyaXZzT3JTZEJ0L25EUmxKSkg2UmV6MXV3enJlQmxlOWpTeG5heXpMK3pV?=
 =?utf-8?B?NXl2RmM2RlZzNkY3K09xWTU1aTljZ1l2UnBzM1BkZCtzaFN0ODhxOURqYmtG?=
 =?utf-8?B?SGg0N3cyTUJNYWZ3SEdlWGRSTm5PSDNMR2tVNlJGdGNjQzVCTE12ZXpDWDQ0?=
 =?utf-8?B?TFRsdDlmRjl4WW9mUmZaL2dJcVg1Zy9ZUFp4MC9pbE5VN21CdkVFcGRRdTdr?=
 =?utf-8?B?QURHZWdJem9XT1lrSjJVZHpjcjhyNlVObFJualFkTHpsc1N1UXJmSHhrS0dC?=
 =?utf-8?B?MUVDWE5UZm5QM1drSGlWVUtOK2x0QkZKWTFTejRBYks0L1B0czkwSnRjem5x?=
 =?utf-8?B?UUc3enZBcC93MEFxK0ZsQ2RxUEpYamdUYlVnYVZVUVV0M1hWeVdHZjRSTTdK?=
 =?utf-8?B?RlgwVkZnZk91L2FjQnRwOUR4SUZHcy9YaXVENkk2VmVCS2lHMVI4eW9HOHBw?=
 =?utf-8?B?NzdoTmY2NXEyVjhNUmo4RHE1c013WGVyQzFBVHlET21wY1dIMVU3NXk2U3RX?=
 =?utf-8?B?MXhtYTIvNEZPUXY3dmpRblVEZ1lpZzg2SGRDK09jMkg5WkZHVi9jdDFBU1E0?=
 =?utf-8?B?TlYrTFpqcXJYdDl3L0p4T0dNd1diWWVjUCtsSTlpc0RCZ1NuaHJJQlNydXcr?=
 =?utf-8?B?Q1VZcjFNNkwxUWk2SitWdmdaSFNOYnhMYXhNMzNRV1NndFNnOENkNlZyeGc3?=
 =?utf-8?B?OFNlVnZKQmp6a3IxU3NqdDQzMTZkbUx0eVM1T0tHYmZrSXZqanpHUytseHJ2?=
 =?utf-8?B?V29ob1hkeFNGSGh3b3VvY2lPOWVOYVlsSloways2bVJ0U1U0R1lSb1Mrc0Rq?=
 =?utf-8?Q?41YfiukMp1QxKVWfLndU2cus/d5QQh1Tn9ByXCG2/7/u2?=
X-MS-Exchange-AntiSpam-MessageData-1: dwIriK6r94Yw0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d178b690-92fe-49ef-51c1-08de79e5260f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:57:02.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmfzPA9SfJHJxsZRLNS71bd7KcZOQsV8idUg2dM8oHv07pSb5/S0qDWLv2orgZjjutLmDcXGMvg/ZiYBiQusPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> Add type infrastructure to know what reply is expected from each
> `CommandToGsp`. Uses a marker type `NoReply` which does not implement
> `MessageFromGsp` to mark commands which don't expect a response.
>
> Update `send_command` to wait for a reply and add `send_command_no_wait`
> which sends a command that has no reply, without blocking.
>
> This prepares for adding locking to the queue.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs              |  5 ++-
>  drivers/gpu/nova-core/gsp/cmdq.rs              | 55 ++++++++++++++++++++=
+++++-
>  drivers/gpu/nova-core/gsp/cmdq/continuation.rs |  5 ++-
>  drivers/gpu/nova-core/gsp/commands.rs          | 16 +++-----
>  4 files changed, 67 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index c56029f444cb..991eb5957e3d 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -160,8 +160,9 @@ pub(crate) fn boot(
>          dma_write!(wpr_meta[0] =3D GspFwWprMeta::new(&gsp_fw, &fb_layout=
))?;
> =20
>          self.cmdq
> -            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
> -        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
> +            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev=
))?;
> +        self.cmdq
> +            .send_command_no_wait(bar, commands::SetRegistry::new())?;
> =20
>          gsp_falcon.reset(bar)?;
>          let libos_handle =3D self.libos.dma_handle();
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 0192c85ddd75..7750f5792b21 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -51,6 +51,10 @@
>      sbuffer::SBufferIter, //
>  };
> =20
> +/// Marker type representing the absence of a reply for a command. This =
does not implement
> +/// `MessageFromGsp`.

This is giving either too much or not enough implementation detail. :)

Without knowing why `MessageFromGsp` is not implemented, this can be
confusing to users who will wonder why we give them this information.
I'd remove that sentence and instead say something like "commands using
this as their reply type are sent using `send_command_no_wait`" or
something like that.

> +pub(crate) struct NoReply;
> +
>  /// Trait implemented by types representing a command to send to the GSP=
.
>  ///
>  /// The main purpose of this trait is to provide [`Cmdq::send_command`] =
with the information it
> @@ -69,6 +73,10 @@ pub(crate) trait CommandToGsp {
>      /// Type generated by [`CommandToGsp::init`], to be written into the=
 command queue buffer.
>      type Command: FromBytes + AsBytes;
> =20
> +    /// Type of the reply expected from the GSP, or [`NoReply`] for comm=
ands that don't
> +    /// have a reply.
> +    type Reply;
> +
>      /// Error type returned by [`CommandToGsp::init`].
>      type InitError;
> =20
> @@ -610,7 +618,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, comm=
and: M) -> Result
>      ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
>      ///
>      /// Error codes returned by the command initializers are propagated =
as-is.
> -    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> =
Result
> +    fn send_command_internal<M>(&mut self, bar: &Bar0, command: M) -> Re=
sult
>      where
>          M: CommandToGsp,
>          Error: From<M::InitError>,
> @@ -630,6 +638,51 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0,=
 command: M) -> Result
>          }
>      }
> =20
> +    /// Sends `command` to the GSP and waits for the reply.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available to send the com=
mand, or if the reply is
> +    ///   not received within the timeout.
> +    /// - `EIO` if the variable payload requested by the command has not=
 been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
> +    ///
> +    /// Error codes returned by the command and reply initializers are p=
ropagated as-is.
> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> =
Result<M::Reply>
> +    where
> +        M: CommandToGsp,
> +        M::Reply: MessageFromGsp,
> +        Error: From<M::InitError>,
> +        Error: From<<M::Reply as MessageFromGsp>::InitError>,
> +    {
> +        self.send_command_internal(bar, command)?;
> +
> +        loop {
> +            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
> +                Ok(reply) =3D> break Ok(reply),
> +                Err(ERANGE) =3D> continue,
> +                Err(e) =3D> break Err(e),
> +            }
> +        }

There is an opportunity for factorize some more code here.

Notice how the other callers of `receive_msg` (`wait_gsp_init_done` and
`GspSequencer::run`) both use the same kind of loop, down to the same
error handling. We could move that loop logic here and do it in a single
place.

In the future, we will probably want to add handlers for
unexpected messages from the GSP and it will be easier if we receive all
messages from a single place.

This can be a separate patch from this one, but I think it makes sense
to have that in this series.

I expect the last patch to change a bit as a consequence of that - maybe
we will need a `receive_msg_loop` or something in `CmdqInner`.

> +    }
> +
> +    /// Sends `command` to the GSP without waiting for a reply.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
> +    /// - `EIO` if the variable payload requested by the command has not=
 been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
> +    ///
> +    /// Error codes returned by the command initializers are propagated =
as-is.
> +    pub(crate) fn send_command_no_wait<M>(&mut self, bar: &Bar0, command=
: M) -> Result
> +    where
> +        M: CommandToGsp<Reply =3D NoReply>,
> +        Error: From<M::InitError>,
> +    {
> +        self.send_command_internal(bar, command)
> +    }
> +
>      /// Wait for a message to become available on the message queue.
>      ///
>      /// This works purely at the transport layer and does not interpret =
or validate the message
> diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu=
/nova-core/gsp/cmdq/continuation.rs
> index 637942917237..8a6bb8fa7e60 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> @@ -6,7 +6,7 @@
> =20
>  use kernel::prelude::*;
> =20
> -use super::CommandToGsp;
> +use super::{CommandToGsp, NoReply};

Nit: let's follow the formatting convention for imports.

