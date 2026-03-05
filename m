Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D091DE3DC;
	Thu,  5 Mar 2026 01:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674649; cv=fail; b=oLJZZUDqNibtDkX3ZGMytkem10jSgE3tpnINPjvquoe7JWqkMtjBqYxkD1/QORdnD7aFt3IcvnuA30aMk1q14wxYQydXkcxl8tri+HhbNIP0Uq/GOGZ3hOx1NePNtTrXwENRLIi75MQoyRp7cE9jn8er1wFRH7fXDu/lsCLPH5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674649; c=relaxed/simple;
	bh=kwS1KaNCRJySSHNvrdWRQdh8sqT7spAyIfwRSdGe3N8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=tQWv94p0w7IIqN9ulloVa/VN3Bn52LubFAxQE8Lqp9SyYwMj+YQfFNqP0D+7mR9yOt2fgYpYiaaWyVMmXpi3cNiucykHQ0okvdkkDmXCsMnOIeM2Jbn7hgUK74MB/yY3t/xlglSvSG3ePIPAqrH4wG318I9caAIApnUEpBKltzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MYxYjIWY; arc=fail smtp.client-ip=40.107.200.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MYxYjIWY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VefaBfmto5LPeEqcfRa4V5vnbdaXpVOpImgQhafT+CUlLm3PXreiYh66Cb2mZpPXFoGLmADR2p+vEgnBQkIIPqehY4miA4cUWpTgOzszDDwFP1AbcGVXqXXtsK3+bCZ55jCyLMzUBxmwUYESASETrXe8+4pf5U2rAbkw09+VQ2Bqnh1iOVnlGZp6vfAGJ2tn0nWFXGJB0J+IPqdBCArLEdkVlzVI5CZlrIzGhdiW+obseVm9WDQCM6kKyoXJTeXXhPZD9Tu6DPGjuborqmSoeXzxb0AdgUDk/kpcKCYsli2yY2Fgz4UahoNKdl6NqW4Ma+xWbVC29aBFFyNazw9arA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIS/M2jtUr4IQoW/e/A5Qor0AIasFstl8PHPqf4eBFY=;
 b=A1+zb4+jS57J8L16Zf8kl79Bxuu4FwHwvM8tqHTPd87vPbQr7+myopOWtvIeFfKeffHklq4DIx5XOYS3j0SWQXeqQm8PtOKn7DhuvdBW82QuacMY+UmE7WMKz7DU2Eo1zC2z8L5Bvvvi2FeHmOktO745WeDSfwqlTBM2XGRdFhmJV+rXcWCcaBELRYqx7X7wDV3waCLvL5S5p34THUUXSQXt/Zn4D7ahZppPIBCJDdACFjR5bUr8zCpDSjqTMJO395cca2f3rfqG04uvIqi0Fe0EcP480v41Wm8MrfgVw7/Yj8fmRdbeJzLu3Nr7ptY2s1ww8oEeDvwm7jVrNtt0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIS/M2jtUr4IQoW/e/A5Qor0AIasFstl8PHPqf4eBFY=;
 b=MYxYjIWYlh+5SE689dVbUI96qsbhIv0CscMpbrZYs3IuekOEQgnwPYFPMib8XKUid1mW6/bkuf56qZ6oBewmKHQwfevH73K6cSGgTQ/0tGm4AsViZ7axVfszaTkYDLB0/x1/dK0cA1woGFqM2JCEHcQjk1hClhUaSpZIyFqZbu4Fc85Ila9OgdkHdtP41e0mSsy6OkVPIret060yhG/Dwn35r7FgQq+1pO/naWxjUTlXaxaIAnIBjfk0WONX+21qWjnuWbZ8NO8BjFh7hQIRG9DV6aXeM7HkenQp91IHUc0qCWN8AkEui2BViyg+wqpJfhCnMGoGkVJgAsd/CnkhtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8550.namprd12.prod.outlook.com (2603:10b6:610:192::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 01:37:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:37:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:37:19 +0900
Message-Id: <DGUGPQYUBXQT.3LANLVUAYG6IW@nvidia.com>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
 <DGU29CRUS8BB.3N1UAT96X34YZ@nvidia.com>
 <DGUGJIQ3ZTTV.2YUMT2HODGY9R@nvidia.com>
In-Reply-To: <DGUGJIQ3ZTTV.2YUMT2HODGY9R@nvidia.com>
X-ClientProxiedBy: TYCP301CA0012.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad7f3a5-b3e2-4a92-1c66-08de7a57bf5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	UlhHPoiRWYWgeTvaj1DmYbBKO5v38QY+eadeCyTn8klUJp3rr7L2CvXBNlwyEw0SJC6oEpRZDkk0yVeJsL4Wsx/eCIQoidkzxAisS+szwAYIfBFlzKWD1rd74QGcMl8Oq0C+2SkYDVDxPaYC3SfPMjRpEgAjB78LWkf7i7DDLQXNmQ2+FNjDwsuyN9991LC+VWpllwkivKnl7nNfbxLQjf8rKuXFnrHzA9OqwynZ+lfMEnhM6WToFR+WFPVMQuOW7v5FzJUzxlWVdFS2+xSgyGPfd/G1eQMFtcDTZpP5LVJJ8frv/nCjes/KjHC6ALG3zCPm4b9h38pn4ntSjhorECuiLePjb3P2Uf4mX+Gou08N3eb1yTbgth0o3rJQcSsTK2gty6z8J/fLx48wSujMk0WDjGZcx5OQ98zPJITgNUirbbPaT7TuWuIEYu6e2tYvn2YT+oqJ5A4OJ7XLbKXE6dZJh+B1GaQHgwKADoYEHj03xKz63fRiEOGQ+fWaWVAzlemLleeI/sQw1dyj/iWmt5TKuu2acIAAHYNOlm1DG6jgEWj0XFK6Yzxz66PGgyuimmK5jrMKkoqbd3ltC8w9m1QubpFM01QI/kBwiZyYafOMsSJer92HkNSBx4vDop6hAC2rc217MdYfQCRZmkuMUCJsUP73eLFA9S02BtK8cX+LSzHaKIWpelydE2kg/Q1czjh+zGyawa82D0+LPDI7ECjj/NO33PQBK3C6O46WUG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUFSREJLeEJNWE5OcEtObDNtbm9QT3pQeXl6VjAyRDVGMWVDM2FpdjRieEVG?=
 =?utf-8?B?RStaaGVtY3ErZThkYWhTVmJCSHRqNlVtcU5jeTFlVy9FbnFJbzZNelVWNmlP?=
 =?utf-8?B?dW80VlJlRm9zejgrQ1huK3NNZnRqSjMwZ0tyRWo2SDZSK2VDajdtZm9IQzZG?=
 =?utf-8?B?RGxVeUxyVVlEVHBaTFB5dkxWZGJKUjhPUDEwTUVKZVlKQ091MHJvMk0xeFNR?=
 =?utf-8?B?MCtDRDB6MXNUOUgwU1BpZmo2dDYyQm9kdTJuV0RhV3pDV3Y4aUgyajVhRjJH?=
 =?utf-8?B?R3RsMkpXSmMwUmVNV3ROeVM5OWRtOHk0NmhmSDVVV1ZHRytQR05QSC9xaUZO?=
 =?utf-8?B?NEVKU1UwTjZuQjRBYjR6MDNiUDF3WURPQlA4RHNEUC9jSHpjemVwd1o5WmFq?=
 =?utf-8?B?MFVITVAyUkdPM2J0WkwxNE93RExFN0FhVWE4bmNIQmlpcUJMdElXcUxVM09H?=
 =?utf-8?B?KzBNV1Y3c0I0alQ1UEo0ajN0bVUydnZrWWVTV1o4NmRjdjJBNEZoQWhHWEFE?=
 =?utf-8?B?U2VrYWR1S3E4b3NCNTZHbWt2OG0zc1laWXZCUk1mMUdLTS96dmVzTUdNZGF0?=
 =?utf-8?B?U3pQN1p3eFNGV2MrWElFWXJCWmpZVkdBaVpIaXRnbysrM002M3BFWWJxNllH?=
 =?utf-8?B?TlFHcWZIS3dia3BSWUhLbmZWQjUvUHhFUVh1NjI3NVFqWVhvQ1VVUWFibVB0?=
 =?utf-8?B?VTVKQzg3TFEyUEE1WVBBNnV3OXVJdndEVFJ0UFBBN0JVNldPaHpRT2xvNTdu?=
 =?utf-8?B?SjV3TkFLcElyWXdKTDgxUFF1NE9HZzkyVlV2c2VGSUtJdzVqS05DWlM1Tkpw?=
 =?utf-8?B?RVA3WXhka3ExejNSRFRObUFIZzhCb3VrZGFtMUZIWTF0ZEgyaFc1SnRKV28w?=
 =?utf-8?B?RlNOeG1ETUtNVTZPQjZxa0JYUzZJZi81MFlySHZjNDBUSTNWWWgyVUVUb1Y5?=
 =?utf-8?B?T05wbmcyQS9NVS9vMU9wWGk1SWF2ZE9UWkJqbUY1OHdCQUFvZ3ZtekVTelEv?=
 =?utf-8?B?WlprNTJqMW51YTdmSmVZcG9pWS94UGFyLzYzRFFHekJ4RW4yRkEvM09tZUhZ?=
 =?utf-8?B?VHFVczBNY0N4eTVWRzhXT1NmZENjZEltV0NCWHVVYjRUOFFxZmVVS1llVW0w?=
 =?utf-8?B?VXJZN0dtclBjNmtaSmpqTThXM1VvVXY0RmFaRE9JS2U4UkhpNGM0NEFhTStv?=
 =?utf-8?B?aTdSQmJ3UDVFVVAwZEVzNkxmV20ydFg5TVkxNDBZUUVZNUdBV3Ayc2tiNk9m?=
 =?utf-8?B?RFlqbitJcjUzdkJUUVZOZzd1TlRXT0hsL1FBdUE0ektoUEcvcXJFSUJUSTJT?=
 =?utf-8?B?a2tDMlc1c3JodUo0S3VMbjdkT1VBcC9kNFkwVytKNVQxamcvOTRoNTJrOU5i?=
 =?utf-8?B?eXNBTjg2VWVOV1lvcTJMaUs1T0VQMGJremloeW5DYnVlNXIweFR3K1QvclIx?=
 =?utf-8?B?ODljcFYzY2lKUWs1RDVBR3B0R0NnZlZRYkkvaFNhNk9PNFFBU1lEcUxiSEpm?=
 =?utf-8?B?KzEyc2tNRzlBbGtldzV4UzF1ZnBncCtkTkJFQzYybGY1emJSK2xzdGdNUjF3?=
 =?utf-8?B?SVZOWjZndHdIN0xpeGhZNGlPOWFORFBka2lWaEtlS3NUdEp2bmFHSFVQR05V?=
 =?utf-8?B?emloWDIzaTEwWHJNZlFieHlzNlRCdVB1b3U2bGtJYUlVdUtFY3JoNk5nakYx?=
 =?utf-8?B?dXZFU3dvMDlKeEo1Tjg3Y2o4U3dqSVRGcytmbmdZMDIxL2hOallpaHJpMnI2?=
 =?utf-8?B?RncrbzV1YjRFWE42dnNsZng4NHNDS29Db3k3dzBUcjlxZGJYSjhDeDhTcXN0?=
 =?utf-8?B?ZVRTUU5ZWjhXQzJpVlVFU2VMTGdvcjJWdXlDbkhsZHlLakM5dW5VQzQ5NlZl?=
 =?utf-8?B?S05WejlNam1VTFc0dUtuSmhBS2swbWJIVVlCM0ZQc2xlSkhNV0VJRHZJNHE2?=
 =?utf-8?B?MzdxS28yY3JDcTFWdUk5M05Eb3dqMWlGZURIcWFQSDc2UG51Z0FLU1h1M3JS?=
 =?utf-8?B?d1ZvNnhSMDJvZzdxS2R0M28xWjhsZWZGSnBZRHh6ckNJT2J5cTBhZi8yVG54?=
 =?utf-8?B?M1UxTGNmVUMwQkt3RUVrb2xaMWF4SnR3VDhvVzFiWUlVbTlLTjhXUXhzUDNH?=
 =?utf-8?B?UXZ4ZDNjbEFpME1vTDJBN0RCSXZGbkY2YTZVazNveGRzUld6eThkOXBWTWVj?=
 =?utf-8?B?WWxpNkFqRWRFanVDUGZvcU9vZE9pOEVMRTZrcDdaK0tNTXVUQksxZi8vM2dq?=
 =?utf-8?B?Wk8ycU1ITTVaWnNuZ0RoSlRPeG51ZHlWMExTTlg3REJjUWIrVFVsQ0RQazJH?=
 =?utf-8?B?RThNQW5aeTEyUWdtZzZpU0pWRk9GVERUazY4Q1dKcStLTldKcWtkUWV3UDdH?=
 =?utf-8?Q?UehYO+N/rOtCEpCyX8wOLrwYELlFliacZCnGW2Eav5QfE?=
X-MS-Exchange-AntiSpam-MessageData-1: U2CyAKigHl2zDg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad7f3a5-b3e2-4a92-1c66-08de7a57bf5d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:37:22.6435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwhM8l/umzffHUDDOv/Lqxjh1Jue4MlqNYFZeR3jTsg5guybdd8i+0xxnGBNwgBEoy9DIhokQwmaUGgk+r7/WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8550

On Thu Mar 5, 2026 at 10:29 AM JST, Eliot Courtney wrote:
> On Wed Mar 4, 2026 at 11:17 PM JST, Alexandre Courbot wrote:
>> On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
>> <snip>
>>>  /// Send the [`GetGspInfo`] command and awaits for its reply.
>>>  pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetG=
spStaticInfoReply> {
>>> -    cmdq.send_command(bar, GetGspStaticInfo)?;
>>> -
>>> -    loop {
>>> -        match cmdq.receive_msg::<GetGspStaticInfoReply>(Cmdq::RECEIVE_=
TIMEOUT) {
>>> -            Ok(info) =3D> return Ok(info),
>>> -            Err(ERANGE) =3D> continue,
>>> -            Err(e) =3D> return Err(e),
>>> -        }
>>> -    }
>>> +    cmdq.send_command(bar, GetGspStaticInfo)
>>
>> Also noticed something cool while rebasing the unload series on top of
>> this one: all these command helpers become one-liners and are not really
>> needed anymore! Here we can just make `GetGspStaticInfo` public and call
>> `cmdq.send_command` on it directly in `boot`. It removes a layer of
>> black magic and makes it easier to understand what is going on.
>
> I think this is ok, but we will still need some helpers (e.g. for RM
> control RPCs) that mimic the structure we have here. But there are a
> bunch of simple RPCs like this that can just be called without the
> helper. Do you think it's better to do this and have mixed helper vs
> direct call, or just go all helpers?

Mmm ok, let's keep the current helpers and reconsider once we have RM
controls and more visibility.
