Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78A537F8A3;
	Wed,  4 Mar 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625355; cv=fail; b=CKm3dswG11buOLlecH4PTCj4m1FUgRuEjv0uMyABkv3+XY04tG0haPtK0LhsN3v8Ucjdjqm1OqtvN9HJj1MiQk74btx4oEWlfSs7YAHWQypMRN6PlpMZXqmIt9P+cQ5KdTbw9Rs5NDiCpzRjHuQUuFE8HeuqQKn0jVbbm6Ajo5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625355; c=relaxed/simple;
	bh=tInzBZej3mTpiqrss3TB1J38Y12OFGra8Cz6apOd4Js=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=RJZRDLGg1S8g898trXTv6IM4ivUY85Tcs+njyma9t14L4rsVIEDsNn5ZJD/zcnq1r/O/EbczkTM8ouivUE4MgTtrLyFGTgQl07Ot9DOEtehhr+15HIX0bmorPxje3TFBuhJ/0/FXlcrJzgt81UQDeLJAtWQM2FFDRnEoSM9yt+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PVyk/X2w; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PVyk/X2w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+jGMAa03cCISu5YN7a+IfyBV2HBSJQ2pQSVxo7R0wMEkPiP2BFwLQrPi+PWeHoi4BCghQTSgK7NNr29Bpi6CCNTdgX3jAG7EfjroMOXqnith0SWYyzfbQgdHekE2EjnKiw1q9UDi+MP9TRH6I0oeq9UzQmApS7t6nJJ7cg9M6YJgH8NOb5W1GHEdkCJZ//NUvx2jJ5NyIu7t3bAVYzZw4KUNC8SDB1NLgzTX3NeX1PbXMnzlbuwdXhnEr7LJxXWirf3TI8nLjFffcCmGIqgfynvkBzUL9EzolFvw+ZvNeI5lakG1r3vWosscqYt5DnsbZa8qssjX5/cFWAIMqD42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3i1rTMkICu2e7UkkQqqJ6OBFUtGYCTSRkYNIXBAFUKQ=;
 b=HJBur2IUS5dZBjNO5T5UAbXfMOak9DRgoVc9JBrLfSOMmVA11alWMn0JCNevGJX5Oeyy5OMVCQxw4oAMsq/4fiLMZNx9qWtJ/Tys7sXMeUxzS5RgWtjCB8EydRmvOrnBTkkiVzRLU4ByFsOWyY4x/GB+6Ptz0F9FXgjuwgr5aJgO0ER0BaLMD45EMz9ZdOYileBvGB/hu9TSxyUhMLBqmVPjFujQQYU5I9W33RdJ5G1FYNoR9n3oAIc15Sg8hGCKtqSjtmwGAELipV9jriAQtXK8hz03HQbUNcZ+Y6IyCDFSv8RkC5jiM16wFi+u2EQLMdpJzQY0xke68C0fz0nhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i1rTMkICu2e7UkkQqqJ6OBFUtGYCTSRkYNIXBAFUKQ=;
 b=PVyk/X2wQX0roy8lUVxQ6Ui0jJAVBxbTnmf2pMR4HATxbGfg5DjLr1QffKBQZ5UbODt+RDjSGwC9TUrKmTDoezcGeUAlaB+UU8BZbY98aHJKj9HRCUmP7UkfnsA1LjOQqwBTUYkA0GBWA3Yd/UgEK5yDhse8NVUQqKNe/B6PSHN24NcPrbuN7bkEMf3YBMD4Qwh52LPAqZo+o7u/sdMnA8i79vfAPDEY06HR67owNhY3X48HBYACK1DQdI8HY3j92E7E8hPSP49p51ZVWPqAAFK0qo0Ql0vWqSX4D5Yn2fDlAk6tyn0YXIaXhu4KF8FVqi2xTAEUrTv/tpOBhwqnmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 11:55:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:55:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:55:46 +0900
Message-Id: <DGTZ8Q6H1B0U.QCPG59PYYCYA@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 2/5] gpu: nova-core: gsp: add `RECEIVE_TIMEOUT`
 constant for command queue
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-2-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-2-a6314b708850@nvidia.com>
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 192b032a-ad18-47fe-efd3-08de79e4fac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	UNX3cJDGvWmFhvUXDFPpgh7jiT+1fg+hl7KkLI7Sh5J1fbKD/KeHn28+zUKgeBiexoPbx/4V1gJmtiLsXjpkdb8984KhheSJXKwqEswGH+HsNuzQ5H8YTsG74e8M7cAlWzD9ScszlstWv0l2fc99A64pHjKakMZRAoRpD38TBTCngz0n0NbiyLjkRFxp3i1EEek1X/7ngb/cuqgTAW2cZWw7t+0a7drd60xeAW1vVHwtOoJHHXMnBRwrDvGl1MngCAReQvQbShnOpDatSa4Zso8DLFDOb1AKovLOyvdczM7z7gCrKxlwy/H54f/1MXvxAv2LMOs+F6u8cVoiCfclp8TQpuymfNDNuDP256VdTvsRf6VaDsXgRxX/1CDs7sFRFV8L0O98VsQovMHXpTkpOG5+ztT65/Xsitn7WA3ChcG/falZsH596qSKIjq9IiLvDcbbcqk+zr/ba37fj0PvgtWwF6HjXVeydEQHgbjjfds6fufEom08PqTv9huktYh429LJZsAW0tec4/J4c+/97M6EasykB2C0wyDzxhMVK+oAiWzIpBR9eDZsyh/FcyArXwGGMf4Nc07bwsos44Bpoqmx0WhTtd5D2aAXTS0T5IqLJ0DcbUqkgdwcv0lwlzEPLFTtGHOawxSmhlSNji255NTAUDFVKOIKCSZskNjaQr2u6uX6aGVxMHP7RJ0KaOYO7Zo4mJed2KAiHCTZQhF2pipHoi8Gt9M3SwYEVzUreys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVRwSVJiV2dpQzNNbzdRaGdBWGhROEpIQ1VIdGp2QkJhYm02MXpnSHJ1dnBx?=
 =?utf-8?B?dVNNR1RoNEZpSk12TW5NYzZUSG9MekdWSmZSaVBuMmhobjExMyt1L2RQSmly?=
 =?utf-8?B?ckx1WGVVSklkV0hmN1JPVVYzajFiR2VtblhLTG1zcHVQNTJIbTR4NWt1dVpF?=
 =?utf-8?B?NHpUR0w1VGJtQWwycXNjTENTRWt3aGFmM0RQZ01yZFB5TFhITzdGSHJsTnRj?=
 =?utf-8?B?LzRVL1dXVlc1VUhQZ3pVWHR4YWdZSURobUxGQXh5QUE2eWU1ZkxvWTNyQkEw?=
 =?utf-8?B?ZjFXbHpDTml2NUltWjNaaGpGVDhXWFR1SFIzRWdEeTg2WExhSGpQV2NjcHJS?=
 =?utf-8?B?NnVudGdJRTZYY05VZFdyc0VtNENodmNBbWR2Tk1kb1ZzTDB3dkhUMy9DWXdq?=
 =?utf-8?B?cTN2NkR1ZWxDb1h2ZUJWUVpzK3FhV25TTXU3dHhVa3RWaEhuUmR0QVJpRFpp?=
 =?utf-8?B?UFBFV3hLVmhTUXNrQi80ak50YTIyenNPVlpURzR2TWdVUmg1OWNZa3h4ZDVN?=
 =?utf-8?B?VUJlOHRhT0RVSTlJMm5NSU9ZeTFzdFZqUTNISVBWU2EzcFhVdkJSeDh3UWtj?=
 =?utf-8?B?VnNaUTZEbWVzbGlFb3QzSUQzSktUT3g2S2JtQjVTVUcwSnlCU0h2N0FlNmVM?=
 =?utf-8?B?UUthWENDMEE0c0hDSFRyaytnZDk4a3hweGxxV2I0ZmRYWFJLdGNlTmlsdjVQ?=
 =?utf-8?B?L2xDOFMwN2xxcmtDeUUxcDVDSkgzNlkrbi9FOWMybTRpZVQ3OS9CM3JSbElx?=
 =?utf-8?B?dWFFODN4RktNYmt2Q29zUW9WQ3hLK2ZwNEllcGlGTkM5UE1sNmorUjJoVjhU?=
 =?utf-8?B?YTRDakYxWjNiVkZsemdZVU0ybml3VmRJNHUrQWV2NTdqL3VraXU2TGN4S0lB?=
 =?utf-8?B?K1J4em1NUVRwb0draVljSW45WEFtLzB1MTM4WFlBYWEzTlIvODZqWW14RjU5?=
 =?utf-8?B?SngrOWg1VXNBcjhIOEVCWWh1U1JuWnFsVGpLSzhHU2JHQnEvbVhzcS82RDJV?=
 =?utf-8?B?emRHZkdiYW02NmFYNzArVjFnNWVSQWZUSHI4d3QyNzdCK3AwZzJYYjFoVnoz?=
 =?utf-8?B?MWdUYVpSYlFORDcvOW1NdWNTdlkrYXRQNVFjTFZWV2JmaGhhRmxXREJZQkxs?=
 =?utf-8?B?QWk4K0V6YWN5WWhHTi9SY2k4L3N0TUxubFQ1eE0wdW5OcHIyeTNrWUZoYWdY?=
 =?utf-8?B?Z2twa1IvYUhKMkZvYmxvM2ZpQ1plRmJjVlp4a3BnVlVDQ2VKdEVzNkYzK0Nn?=
 =?utf-8?B?ckRJVjJxNGlVT0dQdlA1WGhabXJpRzlKYkhuSFBvS2FVU1ZKOHVteE1vb0Iv?=
 =?utf-8?B?Z01LeFhna0NZbXpGdW9sOU9CTElqcTUrL09LUlRvOUhrNTFCZExzSXdicnZD?=
 =?utf-8?B?NFBVcllWTUFKaDBQMkUyOW93Ulg1aXNZUnpLem5vdFh1UCt3eVN5N0gyRHpF?=
 =?utf-8?B?M1gvbkgxWE9aRmNPQTZ0YjU1NTZmaklhanluQm5VV29kdG5LeXpSM3VSNklQ?=
 =?utf-8?B?aXpCb2J4c3V0RHM4cWlCeHlJQktvQnNpVkt0QmZLMFFZMkJxNUZHcXJpdGp6?=
 =?utf-8?B?N1hCT0dGcWRISWZVNmNKVndhWFpkWi9qc3V1WVRTbTRKNWRmQ0JvRkJLYWZB?=
 =?utf-8?B?VXlaMDZFSUtwa0UxKy9HYk5LdVZGNXk2UnZVQmlIUDN5M3ZzOFc5RjhaNTFI?=
 =?utf-8?B?RDRUSldZWU1td1F5dlgvQkVJUnVFVUhpMUV4UW4yZ1FkN0cvTlRReU04cXNW?=
 =?utf-8?B?WjRSOWdIcXlBc0JrL1dwUk5FTis5Q283aUFKNDFMYmpjelp5UUdBSmhpcCtk?=
 =?utf-8?B?QjFGT21uaUNvSSt6d3BZK0hXNmxsRVBCRHRNdERtSGNmYXlCaDk2SlpFMitp?=
 =?utf-8?B?K0pGZFoyOStmR0ZORXg4c1RKSlYxUHRJbUlqeGNJZ1dtK3dBSlVBUCtnVXV6?=
 =?utf-8?B?N003NzF1Wnlxd2NGUnlFYWt2OWhkc2tYcFh2b0t0YnYvdHhlTkhIaWQ4L3FU?=
 =?utf-8?B?SWtod000OTFsYzNodldqR1dnemFDL2ovNWVwakhHY3JjOElJYW5hQTRFd0s3?=
 =?utf-8?B?ZVphZFlsWWsrMmxCZC9BeGwxNkdPL2pTeERuNk1zVjVkNFV5QzlEM0ZHTWRl?=
 =?utf-8?B?VVRmcXhhUWVHZ3o4L21DOXN5RWRmTG01QmJXUDJ4Yk8zeGFyd3U3d1IrSFJ0?=
 =?utf-8?B?QzdTbFp1R3pmdGlWMEYrVDdzaWpOT0NKUjRzajR4Y3FEc1dhRFFJT2lsZmM0?=
 =?utf-8?B?WWkxaWh6bldlRlBHbzhRcUFGRFJnczg2YlJRUTZPOU0wK1dKMnNRMDh5a0Jk?=
 =?utf-8?B?UElUbk1LUlRFUmFQWEdhQmNJYVdDeE1Ncys0eWthQndleHF0NU9iODRTUnZJ?=
 =?utf-8?Q?MzvXmMELU1TaEVmXR1zBwm/uBSkznB7I1WvMYo3T8ybDz?=
X-MS-Exchange-AntiSpam-MessageData-1: GVtvFpxq1XLyDg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192b032a-ad18-47fe-efd3-08de79e4fac3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:55:50.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw5HzL0X/GS5s8y4a8lNCUKCZO58CT6Nh+KrxLyFmj2f6c/XjP/e2M20oVVzVzQWd3chlVLTHPBEMM+okLfXJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> Remove magic numbers and add a default timeout for callers to use.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs      | 3 +++
>  drivers/gpu/nova-core/gsp/commands.rs  | 5 ++---
>  drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 4829830b6921..0192c85ddd75 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -496,6 +496,9 @@ impl Cmdq {
>      /// Timeout for waiting for space on the command queue.
>      const ALLOCATE_TIMEOUT: Delta =3D Delta::from_secs(1);
> =20
> +    /// Default timeout for receiving a message from the GSP.
> +    pub(super) const RECEIVE_TIMEOUT: Delta =3D Delta::from_secs(10);

Agree with the idea, but let's settle on 5 seconds - GSP replies are
supposed to be fast and there should be no good reason for any command
to take longer than that (and potentially hang the whole system for the
same time).
