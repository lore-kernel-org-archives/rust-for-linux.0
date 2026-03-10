Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9F838AC7E;
	Tue, 10 Mar 2026 12:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147478; cv=fail; b=lRJRvWvesgOZXTV/XnO/vn7i5E7bjcvOpvhhMZr+p2iNMquOusjt1P+m/raTl9HWAciGszCtkBWx9/SChxLr3w143iE1oORIRfap4KZ0kb436CdYmghv1VXFDpdb37oJxkLXLS0VSq+EskGdYaecAT+AGorMshjrV4NyI5SU6Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147478; c=relaxed/simple;
	bh=240MzG78fwhR7KrIrW6TkmP4wYroFdpWqcfiKGo403k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ps/oMZJZrMwXn5Hzc2x2vFwtf5c6p5/+th+V5xnBY+PXkhb6EbFXyM+v0UNY6Y21N3sB9Ipdd9Z/vlhrhelou8V4Kj8lnieWkTvSjnkSBGaOJde39WpBcdv+/+BMm3n4JqmYSCq7QSM61lAkL8Z26MOd8i0neiTSBHBmN4d7mtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O6pEauLV; arc=fail smtp.client-ip=40.93.195.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O6pEauLV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwtWsoSXg3yI/MG2bUUy3D5NgSwg/+9uBH8/PtuXrDO0eHN0i6G6IP+CdDvt802FYqRztolEvO62dIG6kJNQceKNUf4cDrRHZM1Afn6lP1h5hwpexRXdF9UvYwsvPCH4PncTa5LP1ih9r9O5zFNYk+q+5S03MKbPFKyDkgQPnu+fhgA6Fl3pog13ujlATGg0ZNSawPeeq5YcWfnUSJJrUa8DqKlCetmD+WwZ+ldqYyiiacvYT4/g9Dp76OIZWxpt0YiKfS/fJsxKEbZMrwpLBXGnItkYM5GtCnGVyHoCJHmusp3LqyB1J1D2p8Nxt0rGGHRFSfcRithShG9gaIAQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBGFn1udYSe97AumCJ9xn3EXjhmoopCsZJJPauKowp0=;
 b=OAKDdocvbOzR8kEk+uk/epViAKG95mbCkTyBqo77PCYM5wa8J2GGHWEiP8Dg3gFl4jtGC0jAiye6AJ5nzesZ+mJcNQhynUYF5qwDLC+hrhpXxBYA6VkcAXkMMPgGKPvpyRYBdj+KXttTRxNZ1FRFEvqlRhUwi/Ms5r2+icwESa3Lecg2rOQmGg2Becya5qelZmCYUEQvsBh8Ol7Jt9nFGHCirBt55OXgEYBtx8ZitvLoJSQBrDBJrk/VD8k4MMSrp2cjnp+taikopDnro8ykRXTNGs1RYNBr/sosgkZMmfce6/zQqPUY/hjvQzWUpfPRY5lWtLLgrzIdHHE6nFilCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBGFn1udYSe97AumCJ9xn3EXjhmoopCsZJJPauKowp0=;
 b=O6pEauLV6YQO0oMwP/wPlOySvNum4rtk0f7d+yfV6PmFw7C1FKRePA5NIWbvl+3rvRUCJCxNv4NzuBqAL8ae6gyKha0FascbA2mb/u86GawNpfPjWxcCCoQS6WN9M5xV1pjGoj450Vtal1LxRJtDDlJD4oclmAUHAfriUq4AZ0YzXO9fUgb7tRgEFLnHR/umAEwmbQqR9mqjMTXqkc7CUVzw+DHSd0J1UGZSbUgJLrYJ0uuUyDYiLFUTknzwUHHa56weusGa3zreYDsCIef6CoTCBr1E97I9aQvDg4u3hvF8o+Txas7gjr+NhyFqDTi8XeQNWEWFXQvzKTPLHOlTKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9387.namprd12.prod.outlook.com (2603:10b6:930:e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:57:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 12:57:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 21:57:51 +0900
Message-Id: <DGZ4BIZDZ5PY.P02LH8L8AOQP@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: transmute: use split_at_checked() and
 split_at_mut_checked()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Albab Hasan" <albabhasan276@gmail.com>
References: <20260310095710.1166-1-albabhasan276@gmail.com>
In-Reply-To: <20260310095710.1166-1-albabhasan276@gmail.com>
X-ClientProxiedBy: TY4P286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b940af-173c-4f59-aeb2-08de7ea4a507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007|22082099002;
X-Microsoft-Antispam-Message-Info:
	fE1xgCFx5oGtfH5UmAbIU+u6KxzcjAeUBUdIxzMwkooanKsY3g5Fw1gnAn8G55UaHS+Z0Dl1wEpO1KDJwpRnHZHXqDL+sjSRESqv9pDNplSVF1JHxmWXpsshicVIRELr2pSBUXKWNAoW4EfADOXNME5nYKMxJkribv+J73aAM5fSAl3rHT5nzQ4Ud5adbhuGcEzE5ysjGPsadyTXuc1QKHpR3nRFtqMDv46HUwGzjWg+4h8lmJxEXxp8uJY5nR3dubELmcMlvh2GGgOEnD8+sDIElwVvHcxmlISj68Q4hJBEHK7Qx9rtML6R9LZG25sKVr10Tt0h222kdzpI9ATsgLFu8C+NMdgADHl1yKqmaT03+AdVkXJPWTHhsAifgmZav5GHMVLvdqGUIBm29jsKLNwmNgxEKi53Io9y1rEc7q+/beX6GY7Lb4WYrX9uxYSAhb4BhNMoTNzwqdgA+2CU0aq8Op9+6dSoC4GpL2iMDQHiCcGFy2o1ZAnX0pHeOl47iU1bgbpg56D15iuT/Oqhi34XSbLWfW1CmxlgAtcmz6WbYXjJBH7ges1vKi3w6F+wEdjzUHxDEibiSG9/7nr1l1sa+nMBkk0XNvRTIQr6ZkkesmuRKGYcUUOOMzdr++LmWugKnDpLMJdMiZI3BgfNiAgjJriqKCrb8fKnYS+Goqyfp4sM8gLp6lHgb6AVh99t9Bdd3PXOdEVDiwWQzY4h4z5EANtPrggbV0AeEwArXrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(22082099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enQwRUVacDBpUEFGYnlaNDhDTS9OZlJUT0pJNjMxTzJpN3dMRDMxV1kwZW5C?=
 =?utf-8?B?YTl2L1g5QXF5UE96RHZHZ1E4MGEvdkFUSnJFd28rZXRuY01YdjVmR2ZuR1dT?=
 =?utf-8?B?UTNKZ1RHSUU2YUZ1NmJHTXpneFJVOGNSUlhBNDRiV2JQRE1EWnFIV3RRR2Rl?=
 =?utf-8?B?c2dWQytSRkh2V29HcXFYOFNNTjBMeHZoVEJBWklyOXBBY2VHYXExOENhcWRj?=
 =?utf-8?B?TWREUFpMWFU1OVJhc05PejJPTkZSMVJXYlpUVjlRYUhmM2hkK2g5VmFqYnB6?=
 =?utf-8?B?aEtKV3ZMQW5JZEtQc0l2WTNZcW1lNkVWMDRqbnhpWHZKWUVqU3lxNTN5d1NX?=
 =?utf-8?B?cWh2RUN1VHVVNTd6dGNjNXFTNlVYcm9SQm9wOVFUVDhRSFY5T0NpUXFYMGxm?=
 =?utf-8?B?UEFtTkY3S1dCZGEwN2w5elI4L1hZWUR2MHdKOFNrbk5GKzExaVhtNG5qYmY4?=
 =?utf-8?B?U0o5NTNFMHRzcUY2QUQ2VU5yK3VkNkg0N2N2MmFtK090VWR5VjBKdkd2TDlE?=
 =?utf-8?B?Q1dmam1iWFBEakxUdnB5NVdsR210MFo3cWtDTVpnYUo4c2lxTkFMeW1PY1Fw?=
 =?utf-8?B?dXJkazljYmN3Z3BCaUxVN0hyOTRSeHkwUHRKWERHKzBRQ0tBemljWTFKTXdN?=
 =?utf-8?B?N3BSZzN3MTdKZ3RZQUdkSEZiWEJ4dlpqbDdqZng3QUQ4eTkvRThvOFhGRnhC?=
 =?utf-8?B?SHlEaHNCcVF5OExnKzkwQUlycWJTSVlCNjhjNDBPR3I3dEY2Mmkzd2NMRWdw?=
 =?utf-8?B?ZGhYWnFqUHp0QUNheVVvblYrZytBeEJVNW94czdqbkRGeEo5ZG4wZWtNZXdB?=
 =?utf-8?B?SUpJeVRnYUJKczBPNXRBbTZnMkNlVUF3b2tPK1BrcWF6K25YUVREM3RJUHdu?=
 =?utf-8?B?eXlBaVdRa1VIM09jUUw2UXVWSDVrQVVYQ2Z0dEZ2TDBWNzZXbFZHZktiSlZq?=
 =?utf-8?B?M21kaWcrVU12c0h2L3BmMmpwUnVJUWVSTTk2eWM1U3BSS2JSb084RDdOcmV3?=
 =?utf-8?B?aDc3ZmJoY1pZWlpIbHVvU212YTNjUGdYNWJuNFltUFIyMDBIdG4wV0c1empB?=
 =?utf-8?B?bEZXZzF2ekg2K0QyVlkrdGt1UTE2N1ZXck83QXltYStKWUZNc2c1TzBTMVVY?=
 =?utf-8?B?UVNWY2FuVk5ldGNaWmlTVjBWK1FYQ3FXVURmbGtXdnpBYnp1R29tYUcvR2VB?=
 =?utf-8?B?T0ZvNWFHemVOMzNlZTc0WHptSkc3ZzdOeC95dnYzNHc3TFU2a1NrYnA3Mm15?=
 =?utf-8?B?Vk1WWUg2K2k5bDVqMkJRalpjRjlYQjcwa2JpTTZodm1nRFVaNnZQbm9ITUM5?=
 =?utf-8?B?Q2srb2JiampRSTd4TnlJUElnb0x6OTRMQWVhWks5eDRxSGpMeTRXakcxZlVx?=
 =?utf-8?B?eERYbklXUFllQS9WK1hoV2F4T3J3eGozazV3MW1Ca2hSblRSN3l3cm84eWQr?=
 =?utf-8?B?ZlVmUklzU05teW9pRGcybE5aL2dxUGNYNmt3Y2FiQ3FhUWVyWCthdnlZTHJk?=
 =?utf-8?B?NlJMdXRQVFZFditKaUFzTlVNdlliZXRVMTdCQ1RlSGpZMVd0Vzh6NmN5cDEx?=
 =?utf-8?B?OWpaZys0bVp0c3ArYnFhMHlNVStuWCtSU2wxZ2x1dytHQWNQK0R2b1ZYckp1?=
 =?utf-8?B?QW92RXdFM05BSFlMSEdKTGwrczdKaUhOaEx4Y2RvLzFrZ21tWTBxZ0dZYW8x?=
 =?utf-8?B?SytycG5lNDNkUmNseDBXaUtzbHZTbHcyNnNyckpoZkNoZ3VGK0JpK1hNZDRk?=
 =?utf-8?B?Nm1UMk9Lci9YWUdvT1RYSmFGM1FPN3RlMTRkeWVNT2FhdmNCWEdEMUFhbjVT?=
 =?utf-8?B?a3oydGVYVVh6MWlpVk96VWFmS3MzM0pMT1NFcUdFSzE2ZFM1MXgwdHpLN2dB?=
 =?utf-8?B?Z2RFS0x2eUJzOSsyZTF5djhick03Vml5S0hwcnJ0d0E1Z2xCSENBK21qeHJN?=
 =?utf-8?B?bWx6VHdMakc2ZGZFZzNmdU5wYk0zVWhBb3RYR2FtNko1UXpwempZZVd3cm1q?=
 =?utf-8?B?WlRMazFCOC8ycmU3cmpwK1ljWnFmQkgvOFYxcFQ0eS85MWVhK1FZSU9WNk9k?=
 =?utf-8?B?LzcvRWUrc0R3Qy90V2dONXFDOEs2cmxRQXkyejBmK05mYUd1emNaRjVTY3Nq?=
 =?utf-8?B?c0JaUmpmTFZPeEU4Rzc5ZE4wZGZMMnR5ZlI0YzBVdGFoT1ZaVW81Q2NTcisv?=
 =?utf-8?B?RlRRTG4zVGVoY0RvMXZ3ejdyOE1hREQvc2ovL3pxTFhvaStZOHBSamZibXVV?=
 =?utf-8?B?R1VyRVNISDlHc2lhRlJTM0VIc0lLUHE4TmIwZDNqREZUZE5FVFdNTXc5dFFJ?=
 =?utf-8?B?UmM2cnpWMExxWGtrZDF1a29HQ2k4Zm13Yi9GdERmaGJDenVEaHhrMmFzVTNs?=
 =?utf-8?Q?J8alJgIv8mmo5ZUSzmMsCaNvRBQVyS44rPdpaMrjNG1wK?=
X-MS-Exchange-AntiSpam-MessageData-1: bMm5GXWKe6dbvA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b940af-173c-4f59-aeb2-08de7ea4a507
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 12:57:54.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZWZe611iC+lIg9HgPiNNyFihrtqp6Q8DdaHqLSht8U8D9c5ckrhC4G8g/Yhd5/eQCj6QXcogbc4wbx3CHMVjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9387

On Tue Mar 10, 2026 at 6:57 PM JST, Albab Hasan wrote:
> Replace manual bounds checking followed by split_at() and split_at_mut()
> calls with the checked variants split_at_checked() and
> split_at_mut_checked(), which return None instead of panicking on
> out-of-bounds indices.
>
> These methods were stabilized in Rust 1.80.0, which is the current
> minimum supported Rust version for the kernel.
>
> This simplifies from_bytes_prefix(), from_bytes_mut_prefix(), and
> from_bytes_copy_prefix() by removing the explicit bounds checks and
> panic-avoidance comments that are no longer needed.
>
> Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
> ---
>  rust/kernel/transmute.rs | 33 ++++++---------------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 5711580c9f9b..643b19406a24 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -67,16 +67,9 @@ fn from_bytes_prefix(bytes: &[u8]) -> Option<(&Self, &=
[u8])>
>      where
>          Self: Sized,
>      {
> -        if bytes.len() < size_of::<Self>() {
> -            None
> -        } else {
> -            // PANIC: We checked that `bytes.len() >=3D size_of::<Self>`=
, thus `split_at` cannot
> -            // panic.
> -            // TODO: replace with `split_at_checked` once the MSRV is >=
=3D 1.80.
> -            let (prefix, remainder) =3D bytes.split_at(size_of::<Self>()=
);
> +        let (prefix, remainder) =3D bytes.split_at_checked(size_of::<Sel=
f>())?;
> =20
> -            Self::from_bytes(prefix).map(|s| (s, remainder))
> -        }
> +        Self::from_bytes(prefix).map(|s| (s, remainder))

Or as a single expression:

    bytes
        .split_at_checked(size_of::<Self>())
        .and_then(|(prefix, remainder)| Some((Self::from_bytes(prefix)?, re=
mainder)))
