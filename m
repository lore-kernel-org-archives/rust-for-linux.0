Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793086557;
	b=kbFwrgxDXWMSJBK0vaxRaA+OXy8DmVAoAFjJx2WsU2PyetznlHnh3ea9Kqcr4pHvWKRP
	 jiXBI/E7CvOXwAc/+ics8VMK4HFsnSYBwHFkngNH/ixpvr3mFRbZ/n7FrwEyePPSF5cSK
	 kn6Oru3QH/zok38nNk4KJNXb0jmRqCt2maF9ZJNcQFxD/I907kPm0BsS/1heUJKDpmKEv
	 esJT/MRYx+DmWK1UtkcF9zvz2DOGd0XwrDorzShrTH8FeHunAOG0my03pHLvTqDjr9djG
	 Gxi3b4GSXHlDkB+CHaNV+HL7Z0+6cWPdA3kdCutYzZC7YZuCSJPHtIkfvWXs5Ovo0ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086557;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YRvAfzxpZKSzBB59Pv7ofHNvhG/+Wabw/3inupPPgDc=;
	b=Um7rKArSMj+eIW1aeJfkNZyZ3PCqEtXTUcWEy+fotjiXYMR2xU+BJCgZZ/MXvQoeYHmP
	 EOxzUO5SuuogZArl+YbBZeDPGjvlkSJGsjIO7jrs2XTlZUS2p6aX2HLEmBSFk/VRIbTEJ
	 fByc8L49aYCc5tPSW9f0lognuIj0gpXcLkojUmhUPB9L/BR+Uvg9puHyqoF3GNKzIwldu
	 i74vLHAbT6+fKtkofmeO71Z8GwQcB+7tTrtQfKvT45vMwX2B5nnspOuhxQd6150X8bHr2
	 F7cG/QOH3O0RAK+YXqK9vKmh5Q5XW76kPp889E28Sa0LKlySlqZj0NPBSfr17npuUGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LCVkFGBF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.12
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F3606A339;
	Tue, 27 Oct 2026 07:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C1F3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LCVkFGBF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ41mEIE04AR7YlkawrWBO7VvzIpIWyJc10jMQ969oQhsWrS2vnIQRUgWtoBibMstqX5Vh3mDHWUv1QH0MJXcybkZ+FHgEgQJmbBk9nOUaPS/mbRzmgE83uewcxHNdpbWjFgA/lUU66qa351/IP5iu8gCA976NBw7YgIi7OnlOddiBkSiiD2itl4T/4Wng4gS0G1m8SJNUG4QL3mnYr6d7RQ/vcQRe2Ft3fmlPOn3ZVgumP06NfsmkEkeQMSTV3F2JcF2F/DRw8oOdfWC/X9c6DrZnUfWn4or0R58la66aeQB65yrZhierNcUrg5yRrUWKWkvWiLcApJ2gUrq111hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRvAfzxpZKSzBB59Pv7ofHNvhG/+Wabw/3inupPPgDc=;
 b=wsqSZABaYhg2SY4lz36jHoFp8YkCLxuPszjy5LP7EHPW2BOkxpN2SNNc2B1Dkevo9VsR/m92TNrF3YzZvg/t6u3dbZLWqqbPxCsKJJptjYPPUiBdJ7gThXDyeOuApXNNlfflYgfDq8xF3f3ddVs79+LsDDZWv+zOoURvbA2cB5gHseJZ/An0tKLCHHoeIyOnguoV7kr9yee5t5Ppf8fA4skYpFY8BxEIDMb33DCOoraAqJsn+h8yaXlRFo0vJSSAw/AVgRqnSjwNVBxHp2jLTeP1krv3JfuzLcjlGqbVtARzUkVfpiNlGzE3cqFXYnf0FuZ0Gn4KVWIcwjZVOZbPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRvAfzxpZKSzBB59Pv7ofHNvhG/+Wabw/3inupPPgDc=;
 b=LCVkFGBFyURAIbIGT71s23aa07WCqou2YuOeX/S1GYEDAZRVfRIYtGIHf+WjB8qTw5VRGn3TMKnFne+x0FvLz+TeTvkbD8Nl9pPBzgzdg9TZvlz5DxgGKU7renZ3juP2sHcuGlPHfkBbnvEMiKTUrCsLar+5Zm1FVLvlwKLZnnmS7mqZ091ynZ0/Rm72TCUdfmhL37KsBKRc+NhW4K/inTUIAshXkPKcAMHwT+yRX5+pv1k+PJepWLDnfrH93C7LPNj1CugEJCioO+wYMMG52CJC5FTH5PgeeVf4WlopE+BdumoUzaw/KTFZDtdGcGiwtC0Qq6bI9Kt7PIqYjLjK6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:35:52 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:35:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 27 Oct 2026 16:35:44 +0900
Subject: [PATCH v6 01/15] gpu: nova-core: gsp: cmdq: remove stale comment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-cmdq-rpc-v6-1-bed9669724ba@nvidia.com>
References: <20261027-cmdq-rpc-v6-0-bed9669724ba@nvidia.com>
In-Reply-To: <20261027-cmdq-rpc-v6-0-bed9669724ba@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYWP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::21) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f142db1-db39-4a99-c49a-08df33fced93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10070799003|261026121527099003|261021123027099003|56012099006|11063799006|261022105027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	GCBGaWOwhJjuwx75ZdDWmoN58KcssCDfKNOUwcvDfXwySn4ZrtU7+dgIimAqLFQj9OFsfmyPEYo+wHCdsXpVD0Ns3pJ+Qt07/n1FEmAeQzPXtn4JdoUydLP8aBTB6zdt6iUgVEvxNA6tS3jTOb8hsRuUlAPIbZKTKz5f/W8RUhXa9gEWXtzmK4Q0yF03eqKc42Ghu8n2ddyTszAOC0uqOL0H+u+QsT5K4EfZ2IlWsyhZsxcFBF7BK/H3BiLojeHbnbYFRTi028vfn3STnBQKjBNQqrgRiu4dauuYYCQo0zgcjwRRTfhozf7QhzLku2UpEVSHaPUlvPYlZLaYT6pNi+dbeCPRbprXxaaSq6Q0fPklKixNqMZI5EI6PnzDcHJ6P9Q71oXKtrWBMSyNPTe77vkcYn3/WRFlYlwnNTepwNVolNkl5JI607AXEz+WD17nuYkWYetsJQ5uhvLiWVjYI1A9KAazrGmlG2x0edfQjsi6f5e26NYvxWaCfmV5tnBhqGbkmoie0MCnqBkrDrtCYUwEOe0+mybsmhLQK8vmufAe2iXuaGtxvhDek/6jTxNf7k0imeqhBvH0pcpMcTUsZjqmgnbO5oxgcggGq+LlUS0XuQMRPyvAloDsNsoeEe2GM20hwVosUL2WF5SXvLnduJT4k1NMKxd6yWUDKEdErKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10070799003)(261026121527099003)(261021123027099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjJlLzdvQ2crK1ZFcmtLL1ZyeVMvbktmU0pCVU43SHpNeXRXblhJNFRHc0V2?=
 =?utf-8?B?YTFNa3lVcVlVdElxYWxFZmt0Ti9FcmVzanJDdmxGK1JLZUI5dlN2dkU3RGgz?=
 =?utf-8?B?MUlRR25RZUdSVXdPT3Vrb2ZvTXZmcmNyQlU4MDM0ZEVhTlZTWWYwVGZrVzBX?=
 =?utf-8?B?TVJiYWJ2QllNUFpWSUt4cWhtajNyWjhJNmc4d2RlSFFSenhMYktQWEJtVjhM?=
 =?utf-8?B?NmZKREptY01vdXAwcUZwYzhTdjFXRE5rbklxMC8reERKbHJBeUJTZ3BMUHgz?=
 =?utf-8?B?eW03UjhpclV5TGpERWhiSnFjcU8vVm9oYnFyb2NaMUtXQStTQmx1MERaSjdM?=
 =?utf-8?B?MUk1WXhKdjBQMlk3NHVIN1JraHlTajRNcHJVemlveS9Ia2Y1eC9jUVhBUDBy?=
 =?utf-8?B?VDB2S2F0eU9WMHk2QTdPcDN4Y1luVXI1bmVZQ2Z1ZXVza0ZRNUhONURabktp?=
 =?utf-8?B?RitqWHlUc3FuOTFhbis0MDB5WTdhaHdIaWszTDRHVGJ2bjdpZzRqdUhrUlBq?=
 =?utf-8?B?bWpYeFFvdTJ5bWhEZWhtelFRajZNVDVpSnVVWG1zaU5ZMjhuY08rM1BRY3BO?=
 =?utf-8?B?cUJVNElQL241YU9QM2I0NWFkOU1TbFA0Q05wTE01TGtMaTRGY2hXOXBmS0d4?=
 =?utf-8?B?NWNVYXlOUFdSNjFwRi9rRWtEMU5IVXEvcGJsVVpwR1NnVWpzcXpOaElobDV6?=
 =?utf-8?B?dHd0bjV6RzRDQWNWWk5UZ2lWUFpMcTM3blJ4QXB0QVA0NmxxQ0ppRGdWeFF3?=
 =?utf-8?B?bm1KQmxzL2V2eFk5cHE5RHlaRUVIOFNveUZTcmFpbEU4ZElaUEV1ZWFWTmQy?=
 =?utf-8?B?RUxKRWxyZ0tuYnVJbmttWEdlbmRTaVN3eUN1MXlVdmE0K3kreHZmOXVxQmZQ?=
 =?utf-8?B?L2lkNHhhaEIvQysvUE5UMmorbTBpb3VMZzllVHl4Q3JXN3YzOFQrRmhHWWF4?=
 =?utf-8?B?ZHRTTzFianM5Rk5CS1ZoSGRLSkpCVm95QjFxTUV1RjJTaSs4ZUJNY0h3Nlgy?=
 =?utf-8?B?YURycTMvUDY4Wnhob0FsYVlYNlZ2alljN2swd1o5aUpRWFI4MzNXSjM4emhV?=
 =?utf-8?B?OWQ0Z0RKRDZud1lGUUkwVTZTcVpia3M1bXZQKzNCU2lsQkVVVnNzSHk2TGp3?=
 =?utf-8?B?LzZPM09zdnBpaFluQkpuV3RYWHFxeENJL0VMd2Rub2lmTkJpU0s4bHpWdk5p?=
 =?utf-8?B?YTZRQTJWeU5Wb1BnZzljUkVLUGZiVktyMW8xUDFCakJobWhvcklrUTBGSkxX?=
 =?utf-8?B?cGtGV0FFZ0Z5ak01cElvVVpCVmRHL1VPSjRTb241VkpGcTd0M0srZkQ5WWp6?=
 =?utf-8?B?VmcyTGt5U2ROT1Boa2JnOXRGMSsxTFdrdlNibTVZMTRNaVhSbUVTWkIrRTJ0?=
 =?utf-8?B?TDViNEZlUGQyNCtnSk9GcGY0THB2MURYMDEwSXQvS3BwL0JONS8vMVlnaS9a?=
 =?utf-8?B?R2NVL3F4VFVzaXdXVTNxZllJcHJBYkdwWUM0d1BQWVRQUzlteW42OVEwODkv?=
 =?utf-8?B?THkwTVdQaGQ2bTFGdy9tQjJVU0ZEZ2o1SVBVQlF1ZUcvSkJ5T21XanQyc2Ju?=
 =?utf-8?B?SUZzZk1lNXJaR0dlOGRVeDNyWTlPenBEQ1crVCt1cGlxL0tyTTNDc1BheFk5?=
 =?utf-8?B?NDRURTd2Mmw5cGhIc2ljakg2Wm5WWWlFY3cvczk4MlB3T01oUVpweVRmWVUy?=
 =?utf-8?B?cHJVS0xyS2FaaDY1K3RoMEt2NFprZ2RiWjhXaEZQZkZWdDQ0aHJSZ205THA5?=
 =?utf-8?B?ZS9nZUtHelNLUGNSNFV2NjJ4TXBCbC93NG0vNlVYTi9OUWJ4OUplRTFZa0Va?=
 =?utf-8?B?VkpzRXRBNHMzSDF6ZWVTNjNFKytYdVNFWWtBend5ZHhqeHJmcjdIaTNvWThT?=
 =?utf-8?B?WkM0U1owbVMweU5MK0RNOEhnMGZOemZKaHlZcnprbDVuaCtTY1JoNHlvY3RS?=
 =?utf-8?B?OWRiNWE1MUN6bWREdFI3aThaZkNQaUxPWDRzYmhtaUM3Y3FHMEs3MWRtS3Fu?=
 =?utf-8?B?ZHBGekRHc2JxYTJVV1JMYnNvWTc2M0VkZ0hMWTFZRzh0akpRb0RzR0tQOFBk?=
 =?utf-8?B?WnVCaVlVQ242VzRGejYyanc0U1Y4V05JWGVseU1zK1d3aU5kRmk3eGwrMGo0?=
 =?utf-8?B?VmtwUG9WOWFWWFcrU2xGOWtucmNBODNSRTVnejYzbjBLOC96RFVLRVBYYTMv?=
 =?utf-8?B?LzJ0cE1naU1kMUxXVFpwZGU4c0x0UHRwblhQQXJjNnJjeFRvSTBxTXpGRGo1?=
 =?utf-8?B?TzVGQ25HYTRheGRsdEZzdVpzMWtQUmxmSFMvYmV2NDd3U2hzTThzQVY5eDR4?=
 =?utf-8?B?SUZWajR3WmNWUjl5bXlheWZuRHJTblIzWDZieW1yYmQ3OUd1K0JibzFaYVE0?=
 =?utf-8?Q?dZEuq3EHLq73sepdLjz0lrVjn0wpKFMs+JqXJv5FTJxXr?=
X-MS-Exchange-AntiSpam-MessageData-1: Dr5hG9tF1fkWXg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f142db1-db39-4a99-c49a-08df33fced93
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:35:52.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvw8RGweukAtrSx9DdCoUmOKQw7YvY184XvRfym+NCZEiY7OcqsjURfMKUbRexgabkf438ly3VWRJk5BUz6uQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451

The message constructor is no longer run by `wait_for_msg`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 1b2f346a237f..accfc1d20d28 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -777,8 +777,6 @@ fn send_command<M>(&mut self, command: M) -> Result
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    ///
-    /// Error codes returned by the message constructor are propagated as-is.
     fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(

-- 
2.56.0

