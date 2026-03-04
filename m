Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F9352F87;
	Wed,  4 Mar 2026 02:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772592852; cv=fail; b=g4tmVAHY+o6DERdsLQwU2gFzeGf1PN3M9CicJ+OdBHPNdRLsHyjZ2Vjx5g7SeAxwzYa5G4A+Gj9M5NJbKsGBwmvlhwmMlhOZz3Qijn8Fia+YfNZvs5/FQuLuCPzwbN9/NnYV/G6ji32YIMIKfFhWqDgc0jL9lZjHC5UyO/qLJg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772592852; c=relaxed/simple;
	bh=fBF6sfXNXUq4diM8FEdhkZwUFzo3W7wUndWLhMSeFS8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=XUg4lnIfejrXE3SQyrN129qn+cniVTa2L9194qj9f7P5eiEoxoL7+JC81++6oEkPAVTffhiHCfNrZFvofKf4+GTaFgt8k8jxPPyPNqPh7Iq6lTE9z37zpPNEQSQYtHLtvx6GoVN6dOZ+w1AY1ycj09gsMJMAxt4JwwX7LYYNRJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MUwJ8qAP; arc=fail smtp.client-ip=40.93.194.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MUwJ8qAP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg3ZkAJtLkqs6NpXs6Ww/VzGvjInhO1LFP7+4D1RT1dQrdQKdt5cbHbFCoLLCWrnL9MP4fxe+mJzpcQdwEQt4JbeoxJ3esaB3G7twsz6IPmmeNp8++WCLyo9trqIt4nP2uQjtAMCoJ1qLnhWhl6TpXdt4YIrk8qNoEv1DG6zpLvWBWQaY+Jm37EGvPdxARkHN1po3bnN2VnBQEPJ7egKYtkVUBEDTdi8wZlXg1zOhlvhfzIIsxLlmZHmP+6kiGD2N8VtITC9LxrHQBB32YWBMdYT9Zy8+PeDRcMhMFVLwnq6BNx3Pg4ZS9eI+mDWyJGODXPc3UR9rDMI8ueOewdBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKn5iJYxA0e7uybFAtEj7f9GLfgUx+kqaroypgBR2vk=;
 b=zSyf5tU+B4v6figl8yvSxx8drfIcwyXUSXvoZOdZV9fEIdLD645MP5Eh8F9JuPSQi8qty8JhtgpTFbEDYuwiOPht3M4/F8KuOZY8TiMUIliPzineGf7rPGytj6J7T8+3SwBgjUdOmyO7Jugj8vnPX+VWCphTe4zmW6jeR1eKvv3TrGtTnWY8FygZ0mJXlagDPJ4LL+ica94jzYJoOupJIPRzsSC3UaU5ttF+nVmsS/joPwc6pCeKTKXT737AIcjBzlSXSeR/u0vZagHKYwfEZMUyia0DqNTvFR1EpVCpaMbJ40hF3h8I2Zx/IdufI104SccsQJtJR7sXtT5uWRt6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKn5iJYxA0e7uybFAtEj7f9GLfgUx+kqaroypgBR2vk=;
 b=MUwJ8qAPqVwHNkH+EjDqmwrYUagEnTcksmaNGcUb1ASXH8OMWQgBAaZKmebbHVYmno13oJ65PAvESJmzHc2wt4/o75OL+RITLLsQ0Q/tPekomC/Nvk3GQR5X0MPvrACYo2QnDEWD5r5Ih4vR0BNbmiVVY5Q9LgNJUC/tJKL4MTo8E1WYMeffCYREF09cHKhPUDBDYCqp0N3rKtVfZOoZv3Jc4pdoduIbcZdhSCsZwEfIg3IzQDXkFvw5xwfh3RMCeE2wX4EffGZnJJ180mriuh6+AFUaTo3lLqCJnY7Tu6RigBup3Fi6XmLO//Xj7VxnJ1HbsjfCXYipyyvDeg94/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:54:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 02:54:06 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 11:53:43 +0900
Message-Id: <DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 7/9] gpu: nova-core: gsp: add `size_in_bytes` helper
 to `CommandToGsp`
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-7-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-7-3f19d759ed93@nvidia.com>
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 878b1863-edff-47d6-e128-08de79994166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	+mPNdumM8655V3UhIPjOTX7PL5f8sZR/vwl//oJ2zLc2hFhSvjjJ5ddV5x+jySCK5M2auk/GPh8DiREyHV8VJew09bOMfyqvAThcW7GNm5fLZgAGufiq6KysfTzWwp+2lc1QWP9Obi5HdunDh6zqNz26r//wF4CUT0LVuzlJJmPwiE12KunIJ8OjK4BuRl6AaL+IcNrSAi3MGwTNlzK4NckREqsu9VirYM+gbvtPGPNVp9p5LSrvmNf1Oc9+1QtY8DO1w7WvO2Q9GTpzA38tGBryReThst42SqHRqBQpg0zldYla4MvijLzkKkOE2sdNBGiS+5BBb3f5JAPtu7CAS+MgNse9vCLSXgxgR1owhpanng36zKcvQCW67Tn3jr0p0Ltf4I/jbv/5LcrfiKpVrliK44fj5nDv5UHda3FLCicI8IalZ7L/O1uruf7/bZUEN2FgqYJNsuVlqWxDY6OHKyQboT6B5RPcwdgvY86ME7uz90AOG3RcpbH3B9YjNi2lBtJ9kpnNBMsUagLvE3J9uuMP6oXZmLIQYbIfqZY33lv2SgGCRfwqrWYZOSL3g84y7ryPsPVEfzFzsn2k3h7vLyxWRVYzFnhVt9KTApMZnnOS83i9x0IpQVYetYOlBdjOKmYa6KQLfVJi2XQc+DJzWFRNNP25kCjhPs4tFzG0R+zLbAFy3pizPHs7tzAP4fc73hRYUlnpWd0SaHhXCRaJgUMNyj/Z9xg0iKJ0R6YOrvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJFdDFCR1hSWlpzVDh1Y0svMU9sYTBVaHhEMkNHb3ZZd2E2M3dIbUZEamFy?=
 =?utf-8?B?M2RVSVJrZXBzb2wrUFpnOFBhb0ZqckFhaGNOMmUvclV1V3JwQTJISTJPT1B4?=
 =?utf-8?B?bWwrenlPa08wNHRhWWl1UnFpL0NoRDk4QlZVTXc1U0hIU0pJV2UvNCtTelBF?=
 =?utf-8?B?ZGp0WUlRMG1hWHRVS0NqK3F6QlVPTHdrZlMxR0JmK001eitwak0zMXIyZDJ3?=
 =?utf-8?B?b0p5OWxzSzVrSkFMZjB0UWpoWHRXV1pXVGFOblpUeG5JcEhQeWwvc1VJc3Ew?=
 =?utf-8?B?QTNCT3JaZnM1VjA5UHdIRVBQUnBpKzFFc2FNc3Q1RDd1d3FOZFBwTXlORTVn?=
 =?utf-8?B?RzhGSkhoblZrNGRlMWZDVnM1d0grWUl1aFhCNzRiZ29tMmQ2dDJhMVJ3NmJi?=
 =?utf-8?B?TTNENFNoNVVPckQ2ZGpNUklEbE1yZTd0b1Jwb1lYdWthZ3pBK3V1aUxtUTZp?=
 =?utf-8?B?aWFXTFR4UTFrNjQ0NWhTN0pXc2lVZWI1a25nOVBBNG8yNHp3ZmhpZE1wc2Ey?=
 =?utf-8?B?ekhDN0xxcVFRZktOWXV0OUZSQjRSQTdpRDRGRmxob3RJNlRBc1FrUDJCMWgx?=
 =?utf-8?B?bW1zWjFxcXVzSWJsZERDMm5GNlBWTjV3TktlZ0FqY2ovRE1RWTgzTlpoaThk?=
 =?utf-8?B?bE1FaUg0UnVndjlQcm9VWER5bmsvVitDMG5ib3NUWXpxYzhDR2ExeEdVbGpU?=
 =?utf-8?B?dlNRT0ZZVVdYY1dSVUdhTklVV04xTFJNRjNieGM2ZUFtSTZ2SnJ1VUFod1dV?=
 =?utf-8?B?cDYvWDlSNmE0aXp0c1BmeDRxd0w3cmxBbzYrN1VreStTOUN4Nld4dXdoUjI3?=
 =?utf-8?B?MVFFaEFMVnZzOUlzczg4UVF4c2tnQjhodGRKd3hpS2gvVFg4MUFYVUpjL20w?=
 =?utf-8?B?eWIwVHBpQ0MrRkdqQUlseXZxRmN3MDdvT21ZMkR0NkZlbFI5VEF1N3dUaVVk?=
 =?utf-8?B?aUY4dTQ3cXJWaVczdHUzdkhVNnc3aG14Q2E5NCsxMXVTSlpaVlduM3cvSXRD?=
 =?utf-8?B?UHdKREVDdllrQXNiMkZVN3ZGTGt4SE1PajF2Skt6Q2xSeUo4cFQ4a1U0NE54?=
 =?utf-8?B?WmJnRHpUZnA2aG9KWmpRelhITmxEVlNYUXBJa0pZQUJCRzlJdU13cVFtcXFx?=
 =?utf-8?B?ekZwRDJnMjVVVkpyb0wveEhDRzg0QXlDcU5xdzB2VXA5VkFkRWZSMVdXWHJi?=
 =?utf-8?B?ZFFxY25xdGYveEg5QVlJbkp4WDdzT1FrOGFOZ2crR0hhYUdDQWRKNWtxVXN2?=
 =?utf-8?B?QlcyeFg2YlBuQjdmK0RXKy9DK25MV3A3eVJ2VVd3SmNWcndRZVl3b3JXQktB?=
 =?utf-8?B?Z0xLc3QyTFMwN2ZiZyttYWdGb3k5aVZMTUd3bnVTTGFxZVRSOEVCc0ZGY2tG?=
 =?utf-8?B?OVIwTFlabTlpYWM2dHBQcGcwQ3h0bzh3VkxsY0oyZUhmZ0pMbVRyUlFnUG1H?=
 =?utf-8?B?K2hxdnJLYnc3VmhyNWFpU1NBcHhMUGMveTViOWliaHMzMjJZc09hc3lIN09o?=
 =?utf-8?B?NVRTOGhIQ2RsMUx5S1IrZkVnZGp3UVNRbEY2bm0xOHR2S1llNFQrWnVVdGtn?=
 =?utf-8?B?WU1odWQ4TmdQbVZlYTFrSDlXY2h2cXgyV2NzV09HNllMVy9MMXJLdkwxSUhy?=
 =?utf-8?B?aDFwV283RE5BYzFHdUFpSTBSVC9ySXpDOUVVQTFETjdsQlZuUmM5a2dzUGFI?=
 =?utf-8?B?dXFnVDhDaHZpYzNBZFBkN0RTNW5sL2V2TnFZbExJc0oyMXV1am1CaUJrTklv?=
 =?utf-8?B?MHpKY2lrK3FZRnpLbnhSZ2tkQnRCbVFzcjFuNnFPWXdYaEV0WVg1QVlOWFVN?=
 =?utf-8?B?OCtmYlNrRlA4NktUVDRqTHJ3VndBQ2V6NXh4Z1ZxamE1elpCT3VaeGhXNFkv?=
 =?utf-8?B?anZzejdqTUNNZG1iWkpGdFZBQnFBSkZCM0ttUjVaQXRZeFdKcDZ0ZERHaVI3?=
 =?utf-8?B?K003TGIvUEE2dFd4L1Jza2RpNkJWZnRQYW9oT1A0Q2NjdHlBZDJESWxQb2N6?=
 =?utf-8?B?bThjVnZSd3VMdUljblFoaEpDc2w1MU4rdERjY2gxeXVYSVhRSlNDc2hRQmdK?=
 =?utf-8?B?b1hNSkp3UzR3Rm16djQ5T2ZFMU5saWRaVjI3NVRWV2VVTVhSU1R6Rk1CM0V0?=
 =?utf-8?B?TmszMWROM0RJaDJKOUE1MFhjekgvenM1RVlpOEhadEVqZG1yUHZMd3FDemMv?=
 =?utf-8?B?MG8yaTRFQitmK1MvZHVYZ2N4VVY5NHFaNW1KZXRnUUxiMGJSanVPS0txNE4w?=
 =?utf-8?B?UytYOTh1OVhVdWFjdHRJU3JRd0wzbGJQSTVZRzA5Q2thUU00MTdlQUdySDlE?=
 =?utf-8?B?RmpVZEtYZ3h0aTFEU0Rrd0FqMzJzL3BKdUwxTkp1L2NQbTJya2FqQkhaVnJl?=
 =?utf-8?Q?aP/3O6jM4p1gmHCkPoGk/oWkNsoGX6A4nwSJtLVpu/zCv?=
X-MS-Exchange-AntiSpam-MessageData-1: q/1p6ASRzsB02A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878b1863-edff-47d6-e128-08de79994166
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:54:06.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsIdUz+1HI9n0LoxymzFOoFFxzN+eNeTe09zJB7vlJJkfR9oqrozJxvanwytMTSHl1HxlllI4wuK7K4tRv62TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141

On Wed Mar 4, 2026 at 10:42 AM JST, Eliot Courtney wrote:
> Add a default method to `CommandToGsp` which computes the size of a
> command.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 48cf28b41f39..3424be4e15f8 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -94,6 +94,12 @@ fn init_variable_payload(
>      ) -> Result {
>          Ok(())
>      }
> +
> +    /// Total size of the command (including its variable-length payload=
) without the
> +    /// [`GspMsgElement`] header.
> +    fn size_in_bytes(&self) -> usize {

We usually don't specify the unit in the method name (the doccomment is
a better place for that). I can fix this when applying.

