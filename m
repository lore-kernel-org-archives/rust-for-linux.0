Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE211BC4E
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731308762; cv=fail; b=HwVhFtc1wt51RaMDrNYPFnLRqYTlZ5yX0L/M36V7MoCfDRSHoPZR6NJnaa/G4bp2313b2jA/l12QoDiU4jCXQrzEtTQJ9u6E3snE3kP1DRmpW+y7ua7y4FY+pv7HUVnBi1eH5g0g6KXNBjypqUgM4PyBJEvuecJT2qXEt2z2nKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731308762; c=relaxed/simple;
	bh=wh5dVZYmsx4xyOBLFE3rAP2942wOIfAc90O5Pw6dbBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=roAFXB+xPY47NXSc2klyGL2pflB+yJm5uTg+Jy0XPzDOpa9Kr9enD9TuFqH28uuvdsjKrOzs+0SR9To/s0mEQsXT8IvI3Smx+Y0zhZx3b85Nim4C413K6FZHpCIoSnglV5ChvNyayr/p/PEtFfioUk2bdI8asLiGLHukb4L1oxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=IQXyhNpu; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="IQXyhNpu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6zpNZNuaPpmJeTv6yPf9K4EWacng7Z+aT+WlaRuDveWJYV64rP7s2MVmnRuaOz95XwQq5h+x+AWxujMK1/UFutK2lPeB7RzimI9XXk6Uy29ab2cOYLVbTaiEOPWiUGUk/j6YXYsXeasv/hctuPogCbxHcHmOEqiU3bvyK4mPZ6sWOUm+kWWnR/7NolcjXccSkgtZWPxHxN8y0dewyV1dGJ0QvKZPr2JO8AiJckYZdEHke04zzmt/gkhIkjOkqOmXjBy7N21HWLqwXCQhXl7V7+5ofqMprI5rKA6cBMlcuJr5tsKxvPk5nbmFxlNEOnKoFYoX33+tRx3+0NgVqr3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brUp/5ajTSWm1HLq4v5nht/+GhG/h3lS3ZWx6C6ik0c=;
 b=H/c+G3NXMLKKLJo2DDI/tTREuEMjksERAPLk+QNtI5mvC72WTzIyIrsoEvJljTqooFg84qjXY2N1e3CoJ+gk/k/THluWzn14VJAV7DbcP3Ee42+LWpn4y3eneJeiQjyL9LFZlDFQs8+VwPEnI2B2Y6I9/F3ZGcqrQ9DJkyB/WYDv1AIxy7RCz/EbiDlBnu7nZbDJcPZRr0dt5k/ii0tBBvJO/fXilbwQkRGfTp5y9N7VtGtyzuyhHOtm4u9wHUElWHlOL/7MB1GdozjBqu00ME8STaiPRzui0Ubwr4WvaykWOVDn2U1wZENmQi1eMVO0F1sLPduiOwCN2e77fnc5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=tuta.io smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brUp/5ajTSWm1HLq4v5nht/+GhG/h3lS3ZWx6C6ik0c=;
 b=IQXyhNputBHKnq3ijwhwPE4YXQzv+uiC7dmuDyfqRuRE3NnyYS59G641oYDP692DyqTpO7219VR+NJwizCFiuIW0LQsIXl5zseu57h+ik9sIbRd/HIkUytr7roIgrI7bEBKm56rRe262jAU4OLiyvnb73Dj7q4COgoiGSpenyEharqChaju8NMc3BmKQy57TTTJ0wqmSkWcMwxP9uNorc91RZ5wJTXnRbiRdJG87WdBMltmNsyyU3CBDdkQuoJKM+79SjybqMXT2BEcbDOsi2WknZR5eX6jj2chqdpzMxKM6HLMCFQqKsF9uFUND17FuraRCkaUc6DrrFXsaDUQsmQ==
Received: from DU2PR04CA0192.eurprd04.prod.outlook.com (2603:10a6:10:28d::17)
 by DU4PR10MB9192.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Mon, 11 Nov
 2024 07:05:55 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::66) by DU2PR04CA0192.outlook.office365.com
 (2603:10a6:10:28d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 07:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 07:05:54 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 08:05:32 +0100
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 11 Nov
 2024 08:05:32 +0100
Message-ID: <2490f0bd-ef22-4393-bf60-603336e19a20@de.bosch.com>
Date: Mon, 11 Nov 2024 08:05:27 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] rust: Add pr_*_once macros
To: <jens.korinth@tuta.io>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>
CC: <rust-for-linux@vger.kernel.org>, FUJITA Tomonori
	<fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|DU4PR10MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: f8451165-1988-4c6a-1f4c-08dd021f4914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVM3VmhkUHdEU200RW9WQXQyZkdxd3h1ZUlZKzVXdzByNFB1R0hXL1NVVmJ3?=
 =?utf-8?B?ekZqYzQzc2xNWUgxd3hxZzV4SjRVRmdvMUZzYTBLZi9MMDFVTldOc3JRaUF3?=
 =?utf-8?B?TlJiUkVZSXEvQXF1YmU2ejdXZTB6OWdCN2I4cEZadEt1enc5ZGdXeDR1ZzRq?=
 =?utf-8?B?STZEaXRNeWtwTm9tMDE5ZnZBNjZYQ2t6M3lRenpON0ZoVDBrM2JiWGNXRlZD?=
 =?utf-8?B?TlZjY29ML2EwUTZETkRZeEUvZ0VpUTVFdmwyZ2Q0bnE5anBGS0JobFlZOHJl?=
 =?utf-8?B?UG1NNUlBbkFzeFVsN21HamdUaW5tWjUzUEJTRHAwdFBuazBDZmxQcDVZWXFq?=
 =?utf-8?B?QTgwM2VFWmRGWEhET3hvb25SbFBUZmhZODhDbC9ON1RnZTVReUxmZEt1K3pY?=
 =?utf-8?B?TVAvSFdjK0JQR3ZJSzc3UGhXVGRCUXJWbVhTS0drb09LWDJmZHdiY0puenBa?=
 =?utf-8?B?V003MC95ZFV6eHdxWkNJYXU0Um9hbE54Wit2QnRCaUR5QnhoQ01qczBsY2d4?=
 =?utf-8?B?QW1VOVZVVmVpTElaczljOERQSGVweXFpOUc5Y2UzVkhSaUJZdjBRVDdOVk5y?=
 =?utf-8?B?WWp3bDl0L1FLd0VOVTB1ajdUbFNpS1N2a1UzSUVBYXpQK2RUaHhJd2tlT3VR?=
 =?utf-8?B?WUtqOTFyREZmaGc2ZWdCU011QkQyZTNsSUo4NkQrTGVWbG1LUm9QVDJvK0pB?=
 =?utf-8?B?WWFkSVB0NXdYT2w1anhJUFNxUFJtbHI2U0FTb21sVE5YTi8yaDZrMDJjK0tT?=
 =?utf-8?B?aWhCRXowYmw4Qy9MTmhaSXpoeWMrMHB0VUJVZXpXT1ZzNDNzcitCWGRpTHNS?=
 =?utf-8?B?ZTh0M0xCamdBSDUxWVNjMDRXSzVxT1dHOGN6bkdqVGlKUzNMM1ZyT0RHQS9y?=
 =?utf-8?B?K3RuOGhJRTBYcDV0YzNSbFd4ZE41bFRkVUxVdkVTSGxDYWVUb04vaDQweHRC?=
 =?utf-8?B?SkNxT2pTT3RqL3hjbStRaG0rcm95Y1VyeU1ER0FRQUtYVlJxM2RLV2ZzSXlM?=
 =?utf-8?B?QnJBZHVsQTJaRGx2N1VDWWxOV0hDYnhuVTIvamZvVUVCSUE3elN6R0gyNFQw?=
 =?utf-8?B?QlM0RWxzRlVncm16a1hiazMzMjl6aDZNK3FLWUVLUkcrT0pxbElJOGQ0Vzh2?=
 =?utf-8?B?aUdnVG9udmlFOW44WkZFM0ZpYnNGam9DdEJUREllYzV0QkpDeTBCNTBweS9o?=
 =?utf-8?B?QWFXanQrNUc0dVZHQnRocjdsWlAxY3E2VWQ5ZnVlNTNjUW5xN2JQS29mNkRE?=
 =?utf-8?B?eVp5NEs3MFJzT0RUVUJYeklRbVBuKzAremRiWGo1MGRxaHFjRFo3VDZXcHZ6?=
 =?utf-8?B?bmlHWVdVMkJJN1FjeUlsTTlQVk9HbnZHMXFyc2lQSGJ6MmtaQWtLT2F0YU9H?=
 =?utf-8?B?N1hQSWNmYlZET3lHWmZRMG1OSnBuSDNtcHAxYW5nUmRVc1BINmNEd0ZsQkFF?=
 =?utf-8?B?RnZ5Rkp1aTN5L3cwbW93MGRoL0JDTTlYaW4rV2pwSXBxZ1NyN0xrVHNrelV4?=
 =?utf-8?B?dGYzdUZrNlBuam9sVDZuVVYrZFJHQmljVnRNYmVCdzVNSGlrdDBTeXB2SEdO?=
 =?utf-8?B?U0E3c2FPd2lxM1FhVVhKUDhXR3ErK1RNa0N2bDhqM0xyNFZ6OFQzL1R5WEk2?=
 =?utf-8?B?TlFudzZHQi9tUEp4US9maWJtR0psTXl3R2JOTGlWRFVxS3RNNjFJTHhRWld3?=
 =?utf-8?B?RDhpQi9Xd0pwT3g2bndaTUVzMkdhMGtuSWpwN3p0YTZ3ZjlITzNqeDBwcjJJ?=
 =?utf-8?B?SEdvVG9nRGwvTmlLQzFqVWMyaE9aam5vWVV1WFZETkNySGNxMU1mRFVzdXU2?=
 =?utf-8?B?Y0k2Y1ByNjBGczhUVlY1bWtUR1M4SkF0RU1vb2NYL2ZtMVVrY1doUEk0OWFV?=
 =?utf-8?B?UXdTdjlnT2NBRWlJYkk2TXkyMSt6TlNBYXFUVFp0Y2tiVUJKU3hlSW9hRzVR?=
 =?utf-8?Q?Tij6hfovksQ=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 07:05:54.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8451165-1988-4c6a-1f4c-08dd021f4914
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9192

On 09.11.2024 21:30, Jens Korinth via B4 Relay wrote:
> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> functions, which print a message only once.
> 
> v3:
> - Fix rustdoc error, formatting issues
> - Fix missing Signed-off-by

Many thanks for updating!

It compiles on top of rust-next for me. Running it I get the 'Examples' 
output. So in case it helps:

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks!

Dirk


