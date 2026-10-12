Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022134.outbound.protection.outlook.com [52.101.101.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18549423E92;
	Mon, 12 Oct 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805286; cv=fail; b=cgVGUukOilLLIbfgcHdZnMJWDZjmn1fszGzIG1i18B7nnCa7sqTL/xxykrpHv0mq139Z6Del3+ZqIX08xXOIZgWNwpJBS9MndwlTDWD4e7+FvE71xgwGa+zC4Mnd85gPcsAt68oxPP7JKMjCRRZgZbW+54FVZw0qdx1kwH/KPA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805286; c=relaxed/simple;
	bh=3KWKTtmyBPTCD+yvVEpH7qjpBdVnVz84ScIqGfm9S3w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Sp/qKeTP1AlUNKbJkKq/m/zMSIqqKrfDbHDQz9y7a7cDVBD/C1vLc6V/qjlaGdJMN5MgVDxma6T6yvcADHznM9yvKTEccN0Cljgqh8a12SqsqEaRhaFdkaeZ7R32VwlVH574g9ul0lDW7FNwIIXtxfFBZmPtrSpReuzfBKN8zKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ielDYp+F; arc=fail smtp.client-ip=52.101.101.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ielDYp+F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLMdWhEnJXiV72dyRICj4OicJ6mK/SmrfcCIv7lZ/1MV8bQ/icFUhStCt2umMzTzMKA2vLyrdT7B8aquA7WpZSKYRmKgrluFmRaDk8xr981NwlKz5tpy5NH6u1TSChHQ+azfeBEETkw4S01DraIrJtAReLqGwIPrIHUb9ALS7ERwarC/g9CM4a571SxccpKPteqee+J4OtP0kP/T+rW2HWH6jR2Sb+MmteKi37/QMD4eFWJik2Grdw8r53OR085o37EpZSwWj+nCc3jFsq6lt6l6nEw61huA5jygJLAHavOVakI+3eqN6WQJZEgvtVxmvAFpiNEHLicou/6TWCdOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pErVPW5wQuayik5g+MdoAs6bi7Nni2XKCVXRtpoy/bI=;
 b=Ru+Mmk/RD33e13GllirPVLZ40Gf/coz+0LXNSWV/+LdBv9E6/BIy+n7LdSO3J67IHJjL/FBAGwDUN4LTD4SXJcVbMWjyXov8QQKkafVdf3e8+DSyEYKXcoSgmWhXBrymPMjLttDIpnGfvNtoqTb8oYPDr58WW7b5YacqJMS+bJyxZsfHcuLAsEs13SvIVjlYm9GhEOExVwZk52YLUJ3YktKtIdrL1bYdBdGXwoOzqN7hMswBY5llmYN6qkBDPLTb8F9ByZQ88f4HLMXgTzJG8sKxyC8OzgRffQJa0j/c3g0eGxDDbRLEUSulBcDk9OXTnHAde8KPl116G0hj4oDm5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pErVPW5wQuayik5g+MdoAs6bi7Nni2XKCVXRtpoy/bI=;
 b=ielDYp+FXmEsMLZTHhI3EHvkKp1c/AivEgNNO2ND3ybQiI+0g2jByt9b6Hao0nf81RQIEkJeACoSNTc0LH7h/0kX1gCbPwM2WZnX+cCyfylbgB8UuhekBpv1VP9RYeRzYmQZPlhkOl0h9SHuoCGp69SYIGQt3gAjHe7z8bqKWJM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LODP265MB722271.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:41:21 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:41:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 12:41:21 +0100
Message-Id: <DM2TYMHMO5NS.2MNVKOAU96MD1@garyguo.net>
Cc: <lossin@kernel.org>, <lyude@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <daniel.almeida@collabora.com>,
 <thomas.hellstrom@linux.intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 1/6] rust: add C wrappers for ww_mutex inline
 functions
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1791799751.git.work@onurozkan.dev>
 <4942155a8873e7f4015c5eda57ffb974a2261705.1791799752.git.work@onurozkan.dev>
In-Reply-To: <4942155a8873e7f4015c5eda57ffb974a2261705.1791799752.git.work@onurozkan.dev>
X-ClientProxiedBy: LO3P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::19) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LODP265MB722271:EE_
X-MS-Office365-Filtering-Correlation-Id: 981a037c-2db8-4b5c-f725-08df2855bccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|7416014|1800799024|366016|6133799003|10067099003|18002099003|22082099003|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bgn3wGfXi6zXpboDJf+qslhiXyUKNlr+ZjhJFjRYT+vjwY9cG/jTL8mknuv4/AR6JVDx5MT1VJRj307s5GGE2rZktLs4ni4H9iTxvQ9pdcwVS5AoCQuQELRDeBrVq9Ui8l7SIMeVCK0j9YlNXlb6oG9yOY7OFvsRWa7UvsqGgW8kkdm9gLhf53a1SiDGYEz1oy9N9darNyqhrMY+cMVAuipBHocszPv5Qz6a3uYOXJ32DahqH3lW0kmPDU9gRGmMqnP/feXVVfyTPRY8mFWLBGfc/hrbrj9PP8YU3dLLSB8K3olDJAwCXwmTF07UPfXM7Ee1GuMHvk2Vr3RQ+g+gLRQzdgKMSmBNk8wBG8LJ+9JBFrl2JcrFulA3Yo14Z2CSZ0Sse1VbQ4O88t4YkRjpAR825+2lVqgHhzfnTp4rUcSvvTGAn94WONXPiU0J53BakAEjQPBdHOGpKIt8v9IzcIM7e5lJ4BU4G/Uti1XgjrMwsihMrxvK8jNpUeqkd2SfERl7dgi47NnzQ3MjQRNoORCkIaosBy+FSj91GzoGMWR8hQMDCVkFe/5xyk0mYxQGdIJaiC7KOJ7m82PkeRwFwm9XBiBGSqgpCNTiRD9q3piRHn16U3fqC+oapEejqpnjyi8SNP5FJAreJ0RkbSk3xpH70pE+XakyObZIPOkA4YU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(7416014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGNEWktJOSsxZ2gxcHRHS1BOMkZDS1V6SlFVNHZ5OXZnWGpCczZGcDFPYjc4?=
 =?utf-8?B?dkV3c0JFTjJubUJRUEVQdTBSVjdxOEpFdkR2Y0JmMXd3cW9RNGJEQjZoRzJk?=
 =?utf-8?B?cng0NGk4c3BUMjRJK0JhL1VjSHY3VDlZcGEyWVpkM0RZNWdhc3JZUUVSa0J1?=
 =?utf-8?B?anFaRkRBN0hqUGlUOWV1aGQ3aWxOcVV6aEYxL0RzcFFpSTNUdGMyM3JOUVJ5?=
 =?utf-8?B?enNVbHFJUEh3anBMSDZ3eUF0VTFvSHhuVkg1Vmd6WGU4aDJOS25RSUpiTjkz?=
 =?utf-8?B?Ny9LU2U3QkV0MkpiTTRFUWVTd2lnTTRqNEtRRERxRmxCRmthb1B3MTk3RWRT?=
 =?utf-8?B?cVhscVlpbHVZNmxzVURKeER4RUk2R09qWjBUS1ZzK0Vhek1JOENKNExLbXc5?=
 =?utf-8?B?bUlBanBVM3FzYmZXOEhjUERLdE9DeGxlYUlSd1JyVmtmREI4ZHJPZ004aFFV?=
 =?utf-8?B?S3B2TCtSbVZCWFhQWkpuVnUvUU02MEJFa01tYi9ZV3BjYk9HTHFFUkkzZENV?=
 =?utf-8?B?cGZxcGRrc3lFUzJEOHFZOVJWOWcxZWRFd0E4dURxUkR6NHNsTitxQ0pzb3BN?=
 =?utf-8?B?dWNBOGw2Z2hsc1BiNzdGWXRwQnB4UnU2MHRnaVF3MDhSU3Q0YzJCOWliTVpG?=
 =?utf-8?B?YWpUUDZlRTdpbUxVSHhQU00reGF5Rjg2MjdNQW13TGEzQlhEQkxPOTNqUkky?=
 =?utf-8?B?VXlvQVdPUERGNXZJcVQ2UnFqeGRxSXh2eGpKTFZ5UUpOQVFFWVFnbVJVUndn?=
 =?utf-8?B?bERpdlBwUG42SnJWR1V4cmw2Z0V3YnY4NDZwUG1DWllKSTduRkl1V00rakhX?=
 =?utf-8?B?ZHdTM09HUy9TODZvY0h3cE0vVlgybWhFUzNUZUlVQm40UjEzSWZYeFlIcUw1?=
 =?utf-8?B?MTBsM1pUQytvZDgyeXNTZVF5MmY5WXMxUzZiSGV5ejVPVlUwU0tqalVnUld3?=
 =?utf-8?B?UUU1c3dYSXo5cnhwTFpObXVXT2UyWjQ0SUppNisveUVrdC9IZmQ4QUNmL3V3?=
 =?utf-8?B?Rk1aQXNYUTVILzR3TTBWSEFhRGkvSVBPWEc0bnJsTGc5VzFtMExLSnBQUXZ4?=
 =?utf-8?B?NytKK2hzTUtGcGVaQjFtMFpYdVF2ZnBWSjVlaW5NZHpSNFZTdGJwV3d0Zmtn?=
 =?utf-8?B?TDR3OE0vZjNuTkg1SHRpL25oVWhnQUJkdXZQeUw0Z3RUWURwdXVMeklFRW9Z?=
 =?utf-8?B?NFpqOFVOenN5WmgyUDJJa0Y5OHg3UDRxVGhCMEFzOWcwM09IeXNlYnFhWHJn?=
 =?utf-8?B?dUxHQ0wvUDU5QXBGT280NGx2RzdGNFZFMGFBWTErWmNFSUF3THJQanpEejBq?=
 =?utf-8?B?ZzJCWjJVeEFFNE9VNGZCZStMREdKYTYxK2lMOGl0Y1Rvanc2V09MaUVrSG5j?=
 =?utf-8?B?b3VNTXYwbDdKRSttYlpoZXBtMmg2RjczMkt5SkNTbXVsSjVKZE9RNXNOUW9E?=
 =?utf-8?B?eVNpeVBtTHVGdWZaTGxqNDA2cFpUUmpQZVFNdmMwQ3prcUM5U0ZHQzVyV0dL?=
 =?utf-8?B?Zkk5c29zaXRodkVMYVlUTHA4UjVpY1BuVDFIS2ZDUTNzWlZmdDIvNTN0ZGRx?=
 =?utf-8?B?Tk0zUHZvWXFpVm9YSlFzVEkxck9WVGFGcVh6dStIaG5WZ2xQQzZZZnpKcG9I?=
 =?utf-8?B?S3A5RjZPY3dNcXN5VzFKNzdGVnViQURxc1NSVHJMWDM4YmdLZXJUY2xETENT?=
 =?utf-8?B?ZUFKeHdYU0JuVnJiN1YwdUVUejlHVkw2djJocTJkSG5SbUZGcVczSFlNSXhw?=
 =?utf-8?B?WGV2czVaaGxwSzdDUlg2VGJEYitGOFY5dFVCSkRNdDZKM0krMnZkQmdjb08w?=
 =?utf-8?B?YXFxMXhxVXgwYngyUmxwYWIxNXFOL1dpSkpNMzk1Zkpra05mRFprU3FFenRl?=
 =?utf-8?B?UC9oTkpQQTZNa2JVblprRjl4M0c2VTFJVmplWjljT284cGpmb1JzUSsweU9C?=
 =?utf-8?B?UkJUaUU2ckRmU2RxUGV0UmVHeEtYM0hjdjk5YjQ4aC9MSk12bmFjYnplb0lT?=
 =?utf-8?B?amNoOTBkUUpqMEwwaDFxRGowZzlaR2NXUDc0ZWE1MHhMRHpVS2Y3ZHROYWQz?=
 =?utf-8?B?WHhpcVlqVC9LaEloRHAvTENaclRaeWFwWHdya0FhUHRpamlpcEl4MEh4QVBr?=
 =?utf-8?B?eXIyaHRZc2IycXNRQzlSOFJWOEI1cHVoZlY3QTZlL2FkMFRMTElVeDR3bmVU?=
 =?utf-8?B?ekJZUkRWbkFFNTIxY0RaeXV5bTF1aGxzR3JBVjhXdGlWQ1czSFJwbmd4em12?=
 =?utf-8?B?bUtXaGx1Vm9SWkVNb0hDRldZdHFHTk9zSWZTUEdCS0hUVU11dDN6dGNhWlNk?=
 =?utf-8?B?S0hYeDl3N1IvdGIvQmdkeTZnMkxDL0F0T0pXM2NvSnVxTkNWL3dvZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 981a037c-2db8-4b5c-f725-08df2855bccc
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:41:21.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vfp8pbixbOEcvrtcoOwY3XBrlkAVCR721KvHfuTfLxi/kJZpc0iEF+cYSq1yR3uPbBbc74JLCINQNdqn6PlMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LODP265MB722271

On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:
> Some of the kernel's `ww_mutex` functions are implemented as
> `static inline`, so they are inaccessible from Rust as bindgen
> can't generate code on them. This patch provides C function wrappers
> around these inline implementations, so bindgen can see them and
> generate the corresponding Rust code.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  MAINTAINERS             |  1 +
>  rust/helpers/helpers.c  |  1 +
>  rust/helpers/ww_mutex.c | 33 +++++++++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 rust/helpers/ww_mutex.c

