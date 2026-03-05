Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013044.outbound.protection.outlook.com [40.107.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D0B3368A8;
	Thu,  5 Mar 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772676614; cv=fail; b=fqqkEYH2iox2to7GHy/hT8Pw6wv+DjoCVAvDr/7lU06x2A4BoNjPFGu/7/dTz2GLFns7SxqZi2uI6qv3+EgyWvalyBZPWnO8XnoaoEb+gvShQ9iC004SCnPbll4QeaSz3MnKSjuvRlHbnkQiR+oLhZNiLmoKeHx/W9tpnD6T8Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772676614; c=relaxed/simple;
	bh=OZYPaSZQ7+PMmfOocU7relQ1T4QpuJGMEy1s+wjUdzo=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=TqK4tUJ1VpYPBWNTTgY4BCy6738TDBcgdzPQzitAaikJydauV6al7SG93DUqXptTN6nwjafKn43n7TH6IHGAuk1rKi3hXSDqH8HG1yxhIJHCd7oQbRSw8i9YMJXlm2vy/FdmLjIvEkz5IZTc0WY4uaNr9R2fLl5DTcwkaPVeFRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uACXe/Zq; arc=fail smtp.client-ip=40.107.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uACXe/Zq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoxGMULsE41dvYioMxl13dfPX/0aoXJcwt8CjqLohWmoWiPUpKuXX8PRqo09uCJMaq3llGDeHwS8eQ+W5JIDDEbcyGlCHldPNNiYudu7SG1xn7QozCNrV29tIK2TUNpEJRLXTb7l/IPx4CtjOhd4G6j53+kXIkAJUJCaid4LO9Gwp4i5CODx/mrh1lDAsSGxIBAfhm0vpBcBIV1S0cvGZKWgrOZ/gPwkZLjolpzHTZr4nTRZwSuUghSLt8eRxELYr3C6Dr4E4PgoMkNcl7vRsCyDdpIOrk51LQMcxXjLVLfbLezHB3Tg/wmby9udKH6x6pIDUI52VSmnBJNloJfg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pvxbo4AKFT9rLv4O5LqtsUw77McnmzCiWrO+9AFxH3o=;
 b=euFBhnjE4AabDhKDzggqAgAFFLs25gUQArBj4VkJmayqFFU+wmXaKsZXtUkrfF9Lqca4BEEE754FQsdzkoBvCG/UXuY5Q++iMR0p9wEaQlraZfysZy917+dbufRfpslgnvdpdL7ZCs9pt03PWNqwwjqSSeyszWBUnC6UUucUdyZiF9W7Lfpx2X/Pr2N2UurbwRcSYXSAxt7GLQioAt3yL4tt/9RMqH2BpyyDfcPlQCgVVY3M1H3hcoKkagrr0Ie8FcHGISqXGyhXWlEP26gxczMsQHVot6X3537IY5Qeps9vgFsSxupTi0IpbxMW40ilSt1NYNhQxzFobl1IlDPRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pvxbo4AKFT9rLv4O5LqtsUw77McnmzCiWrO+9AFxH3o=;
 b=uACXe/Zqq5fmwCmjU1Tm4JwxIuKIB2I47ji7ifp8cxFfWXu0T45C6tIs0Tn0uVWmlIQJPS227xzzduLYehEa1P6UlVc10m+MJoPNX0ECrDYd891iO48eyGRhYMPdvBfpE79offSTJq2yqJjp5EARhYwg/0SbBB5Ks7Sva1wYlNQpRXhblNlzeyCgGo8yqorCOwSmqzyWA2yNhzq3DtzhFz5ZmlrKqrsdFutCjKJPQ1XFwxrq7Lh27Orj7O1nks1l41r55ySgaTB9IMwgkXoZ3k68fv650jAYKFDSMkKA/B//55doWt+COMckIABKXJuapHWCkWCAoWged10jfnYygw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS4PR12MB999101.namprd12.prod.outlook.com (2603:10b6:8:2fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 02:10:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 02:10:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 11:10:06 +0900
Message-Id: <DGUHEUO4O47L.GD24M2B30IKY@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
 <DGTZ9NLS9TPM.2NRF5C9VN2B7C@nvidia.com>
 <DGUGNCEXKDD2.ETWE4H89AL00@nvidia.com>
In-Reply-To: <DGUGNCEXKDD2.ETWE4H89AL00@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0232.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS4PR12MB999101:EE_
X-MS-Office365-Filtering-Correlation-Id: a722d124-519f-450e-1990-08de7a5c53fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	gcRlvU+ZuXaFyvUuuFJYMR4Yczbrg846WHi8kvLowo6yYgRtB3Lo/wh1YpLTArQktPoaQw9YwcJB21HH7BQ+oPr3bjC2bMhsbfyiMnBiF8/ACltyWm1zNnng+/z77gGk3Kf1yNz4jdvgmXTfQyPGzXE97juFTVJP4xIbnjpCDza9DHXwAtZoWk3gniQtjAeaPSOH1vcUreBao9Nwb+Rqu4ilYYZFTe8JN8megCxsfjt+XervtXzE7Ld7p17E5rcUfAgP2Xx/K04MKgVwmTDTf8bCxOVHlor6PPurqJzZbT6nRaCcNQjZmzCwgkd0qI+poun03ksttQzsSO3SIdm0Jqx9KjEMnsFikSb6lDbNHwi0ti+vLcIminMr5vQQoO6rU4ZzsMpuGb8BJvFmTefY3V0kIDzNzQ4xhL+F1lvUZbvYcVxz2gzbBhh9B6bGUElcKhGeZ4rpJZ9UGpxQahZCmLJh045BSCfRAXhPv3c7HhqSDCe08aaCrAaPZVjrhihhpAORZcT43scgLuKqp42VyOUGnump3s1OXTKAn1DLC5UCm5LZRMpGPCkhtHXiCuRJxBx/vi9adePzSwsrAgVaDCSDzQOG5Q0PtAjz0xO13FEZHGXr0jEmC68mEaP8xAzFAr+Z6siW/sbx28zRAhJFfZ+Z27PDXBEOkwmvNHt+tG1QFy32fwqUN9QerQndV/QJHa249KaKKJ4oYG+vH717ZOExfdzROpBlCOP4QUGZ2h0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU8xVExpWU5WendDZEpFdGZjenRYZ21ILzhUdUlwTzNMMFRWS2VqSUkxcHA4?=
 =?utf-8?B?WndpS2VRK2kxTlpmbDUxSHNoazVnemYwYW5BRnJ2Y25uSnV0dUVsTWMzSUJJ?=
 =?utf-8?B?VDB1bVpoRnVOalZYUTNjRnhHeGtTZ2Q0dnAwRjVkbmIyQUFUcGVhTWNrTVo4?=
 =?utf-8?B?bVNMd2FiWmc1RW5vcmswQjJHa2MzOTlaU0daQTBYV1Y5ai9HMm1CR3lMU2VR?=
 =?utf-8?B?NFpZTEw1NmtqdStTQXhzaDNudjdIZGdqYXpRbFZMdEt3Rk05MXpSdU1DQ1hT?=
 =?utf-8?B?QktDU1N6WWV1ejNvbmRieXdkLy8ySlY1OFN2bDZkaFlQdlhGU3F5WGErZGtj?=
 =?utf-8?B?N21rSldFc2hvbFJpTmlHK0VaY3JiL0RuUkxoSElXeXQ3UzBZSUhTbE4xTDVZ?=
 =?utf-8?B?ZXZ5RTlPTW1YWXk0a25JcGladTQ1clljYXQyNGp4dVNqbUVmZWVHK1FhNWJl?=
 =?utf-8?B?TWJJcEpCeENtcTNtdGltUEdXU0FUQS9VYTdrTFJqajI1YzlSWXJ0UStldEM1?=
 =?utf-8?B?QUViamJtakphOVROZHQ4a2QzRVU4cjRhWWZnRkJKb3oyeWNZMnRkbit1MTA3?=
 =?utf-8?B?UkpYTE1aSWJydmcra2FnbFdZdUVlQUVzaG9kcDJ1emRyMld5WkExVHdnK2ZZ?=
 =?utf-8?B?T0hHcEd5TmNzMURYUVE4Mm9iblZ3S0dSdTlGZEkxTHRHR1Q0L29sbzFlelBZ?=
 =?utf-8?B?RkVOcnczODRTbHFKTzFHUU9VY0c4NHpQNGlwR1g0SC9TWVJKbm5pWWhlNWkv?=
 =?utf-8?B?SUpJTEJHU0VhdmMySHpXdXRMVk5pbWtlUGlaeHgwaFZ4NkJ6WEZsWG1hVjdK?=
 =?utf-8?B?NFBobmZSdFd1ZGllc2xUTk91TzZQS2hnM3I1ang0ZkhCNzZyTENSRHBDRkFu?=
 =?utf-8?B?Tk1BUDJJMWVlbFZsQ2JIM2FwZEhhQ3NESjEwdDFKZlgrVkZjNzMwbk9sMmYr?=
 =?utf-8?B?UGZHRXR4NU04NU1sNk5acjhVOE83WU96Nk8zZmEwOEZEVEJYQjFzYVp2SmQx?=
 =?utf-8?B?cGhoSUg2bnlMMzlvQ3RqZ3BzakZKMEZHWTFBM2FpT1V5NzdrZGQrWlptMTYz?=
 =?utf-8?B?aENhT1IzaWNGMmo4UW1kNWxPZUd4MjhpQ1VGNWF0M010a2d5dGI1ZFNDcGV0?=
 =?utf-8?B?T3ZwdEsvU1pGNStoVC9aRnk5OC96di94Q0VlcmxCbUFjc0djNzFGMzdaTmI4?=
 =?utf-8?B?YlRyUEFHY0NZcEtRTzkyZk4vMFBVLzVSRHZzVTR3eHY5bURLRXNyaXAyWGNW?=
 =?utf-8?B?c2h4RmJEMmtyREp2bmp1M3EwTnpyVWNLaURsTC9nMTB2ZmUzZGJsMHJmdWJq?=
 =?utf-8?B?VnJjSVNNTDhsSmNUdW8zSkszNG93UkkwK2JCblU4NlZvc1daTWtxV1dEdFZW?=
 =?utf-8?B?TWxsNTZWS0k3T3JFMWpGMU1WY0xZTDRwaFNsajk1cXpsczBCbFNFSi9NOXlM?=
 =?utf-8?B?WEIyUU1mZFFQNG45Qm9zVWhJdTZhTFlHWEkvNmRLSUM1b2NoYlZSZnFEaU44?=
 =?utf-8?B?Q2NDaXlFeDQ1SklkOHFNd1dxVHd0MlNzT1Mzd1ZjYWxiN0gxeFViV20zMDdX?=
 =?utf-8?B?dTh1RHhvWVJRbmhTbVlUS2x6aUdQNURjKzFlRmpoTkZwRHZjUGRCcFhjdWIv?=
 =?utf-8?B?WFh3TEdXWUpTNmZHbGJlVWVYZjExQ1JVc0IyZGppRjNwWHQ4UnJkc0hSbmJE?=
 =?utf-8?B?bHFtV0NmcXdCbkdCN1lZbzh5WEp3WityOU1Kbjk1NXBMOFNJM3lSVWZjZnRx?=
 =?utf-8?B?alFWWThCZUE4eE9GVEhqN2h0UVE5V2h1czFrVDBtTXpsYlJHNUczK0xtTStk?=
 =?utf-8?B?TU9NSW1JUWdPblNOeDduQVN2NG1qakV3Y3B1Tmkwb1AzWUZtdGhtcEk4b21i?=
 =?utf-8?B?OXRRUUYxOVpIazNCYXB4ODlFakZacWpsN2V4c1pOWmcvQklzaW13cjM0VVk3?=
 =?utf-8?B?eldJb1ptdDRuWnZzQUtVUGRqMFdWbW9vaHlKUzJlOXY2YjdwamszT2tHNXM0?=
 =?utf-8?B?aU1iWndqSFpiVXcxN2tBSWtWbkpaYjZtNHQzN2FjNlQ4Tnc2MmVzZW81K0k3?=
 =?utf-8?B?UVpQOUhkTzFJVmZaSW5lQkVpbVptdUxOeGduOXJnYXYzZmJHeUNGbmJMZ214?=
 =?utf-8?B?VWYxUkYyeUJ0STE1R2xGRFo1bGFVVTBKdGZnZUZTMklaNWg3aGprdHBDelVl?=
 =?utf-8?B?TlFCRm5JRExpanFsMkNZVGpMUHNkcnlvYmhsc2ozRnFySHNtTENZMkFrZjJ1?=
 =?utf-8?B?dTl4RzNNd0g5R1RvM3NSNXBKNmh3cGlEUGhNam04SGNSS0JseFFST0oyekRK?=
 =?utf-8?B?U0RrZVpUMWRMWVZaWms5NDRMMzFndENCRXlpdmlVRGQ1SGJHNHdjKy9pZGRY?=
 =?utf-8?Q?QROYdG2zH+dBlX28zh1nbJJ3hEfa7GMkQN4EkkxM0SJRY?=
X-MS-Exchange-AntiSpam-MessageData-1: /hlBPtZN8oflaQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a722d124-519f-450e-1990-08de7a5c53fc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 02:10:09.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xz8otuAa654h+eOHxPbGnQ25GbeIKrpfae9itMxHxxlzio21jgsGIlYzuykNSh/W3AKRF6ssSG9C5NGBUwA5Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999101

On Thu Mar 5, 2026 at 10:34 AM JST, Eliot Courtney wrote:
> On Wed Mar 4, 2026 at 8:56 PM JST, Alexandre Courbot wrote:
>>> +    /// Sends `command` to the GSP and waits for the reply.
>>> +    ///
>>> +    /// # Errors
>>> +    ///
>>> +    /// - `ETIMEDOUT` if space does not become available to send the c=
ommand, or if the reply is
>>> +    ///   not received within the timeout.
>>> +    /// - `EIO` if the variable payload requested by the command has n=
ot been entirely
>>> +    ///   written to by its [`CommandToGsp::init_variable_payload`] me=
thod.
>>> +    ///
>>> +    /// Error codes returned by the command and reply initializers are=
 propagated as-is.
>>> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -=
> Result<M::Reply>
>>> +    where
>>> +        M: CommandToGsp,
>>> +        M::Reply: MessageFromGsp,
>>> +        Error: From<M::InitError>,
>>> +        Error: From<<M::Reply as MessageFromGsp>::InitError>,
>>> +    {
>>> +        self.send_command_internal(bar, command)?;
>>> +
>>> +        loop {
>>> +            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) =
{
>>> +                Ok(reply) =3D> break Ok(reply),
>>> +                Err(ERANGE) =3D> continue,
>>> +                Err(e) =3D> break Err(e),
>>> +            }
>>> +        }
>>
>> There is an opportunity for factorize some more code here.
>>
>> Notice how the other callers of `receive_msg` (`wait_gsp_init_done` and
>> `GspSequencer::run`) both use the same kind of loop, down to the same
>> error handling. We could move that loop logic here and do it in a single
>> place.
>>
>> In the future, we will probably want to add handlers for
>> unexpected messages from the GSP and it will be easier if we receive all
>> messages from a single place.
>>
>> This can be a separate patch from this one, but I think it makes sense
>> to have that in this series.
>>
>> I expect the last patch to change a bit as a consequence of that - maybe
>> we will need a `receive_msg_loop` or something in `CmdqInner`.
>
> I agree we should migrate all callers and make Cmdq responsible for
> draining / handling spontaneous messages from the GSP, but I was
> planning on doing it in a separate patch series until now. I can put it
> into this one though if you want though no worries.

If it ends up being convulated, let's do that afterwards but since it
looks like a quick and easy win I thought it would make sense to have it
here. Your call though.
