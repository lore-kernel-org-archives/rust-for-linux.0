Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655452F261C;
	Mon, 16 Feb 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229134; cv=fail; b=WgdkTufkIccQ3a+jr1wiid/H0xYtTP2GFDdqN4c1Hu/iOUFz3Tw+fZSXhjUKBDlIO5jo3B/U6PzPnmzZwB2ZCJYGB7VPinMquHjbKbBPEfo4AdZFuZ2Tz/i64vCWGkOsnWwlQLs5DhtzKYVI7MWiYWG3WKQNPIITqv3ZDPXfwDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229134; c=relaxed/simple;
	bh=lLWas88/A/iu9acYrmzLJyj0BwnBaDQirTDZ1J5zWkY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tzGFQvu2XTJdrI0iufRuGh9Xfhz3ZQPaNCgKq0dADsvzUhqp4peGvvIdN3wbMZFtWFX2oy6KkX+3xOjag3LN4uC/gKdNkEMWY01/BbbxLil+MsJplnHy6GapgEtW78KcVa2lu/hwIaixa2WXWizlvu9uzs3p0rCN7Z0v/QJcsNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YYadRSzX; arc=fail smtp.client-ip=40.93.196.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YYadRSzX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROdOUQxjIo4Cw+ZKp0KfwMIE+gkEOvd2d8QG8dE9WM7v6F6XeJIiGG9lcIj9q1F7lCZLLYe6YvwvtxCUEMnzIhTkGGXkZ4OGrsD6x082wNYh9CZyz9x3BWn+Q5WrwHaMMlPFj5dWQXMsC7CeozkZ9T8I46XDAtS+KoEUcuNufPaVwomnA5q1lqV129/mCPSrSOlFHf2O/v9mhDyEjHQHevCTKOw/GuQwvaWl3x9FXXG1TC/nLklRColU/DY+03rqq5zSKfmVTOx0GUwgknyGtiq+QpeRZV/Vful7oU9aH0dxSfFaMbVwu8lDWPgdkcel5mmGS1kzjgv9Ix7p+thtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqMHwel5aejcZ/h7F+fWey3srDVEK77hUijpg5WX8XE=;
 b=xodYS8zZ6xgghw0CLWV2eXSZGSjV1zEbjm2lnBf4P/DbpMYXy3hpDcMm6hqcwy0IxtF+H1r7m8poJFD6u7Q4XPK8tcGqxX/iSZj0j0tWxNk1RBV2EajAyj+WnT8VFlryM51TxsZIdz5fbHOjsyar04u1aKfhYfmmMzSWni4457B3hHW9jjtyGkTnG02UkeA5fpCFu2ILeKk1QzLgipvu8kC+VEq0jpEqJz56AOluNska4t7n2EZqesds61LUGIzGpQQshlykWZ2tQ8q9vXaIKrj9O3pK+IFEsaJ9U2b8pn7KDaj54fot92rVinROdmyYAS1YngiTZJmy4T3XB7wUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqMHwel5aejcZ/h7F+fWey3srDVEK77hUijpg5WX8XE=;
 b=YYadRSzXO+vOmIiA/XOR9vAMfgP/l72Yc3DH6A0V9572kI8PTR6k3vwTIzOUGLrm/+eX5HVpzxu3EyxOyGKYim/rxfmaXQxyv4QasklpPBNDprbXoeUPmek4+tCEo/y95P8JuFt3/c4YvBr02L69fdeFQIhi9X3uTKLTmjVx0NOKn0cx7HjRZxJpFYaDUar+2hLRyesdUVCuRzry/jF/PSZ9dDnpvWAgD9zes3A1y+Ttn+4510L6UfPyx0p/BOL8saRGyIfLBFZ2LxPUYULBcZ3cF+0UTyu8l2Rh/RYEOJn5tIyh1BGN8a4wrk3OLXYITL8AQhiwO1TehIQhm11Afw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 08:05:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:42 +0900
Subject: [PATCH v6 6/9] rust: io: use generic read/write accessors for
 primitive accesses
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-6-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 394b3683-d522-4f2c-20eb-08de6d3226a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEdmMEw5NVFCOW9kb1FFenpTejhEMUNmTmZSVXdaekhoeGFBU1daZExQbGhC?=
 =?utf-8?B?eFVvLy81Z0JFMStXcFY0ZkUxbyt0UUhVeVREZlI1bzF6NXRtMGtnSXc4N2Ju?=
 =?utf-8?B?YzdmS0lHZHZFR1g3YUFEUE05UnFYT3RMSUFwcmhiU3pPZkpyQU96SzJNR3hB?=
 =?utf-8?B?NFkvY2dnN3VCQUZiNGp6L0RyNENkdDVwMlJ3c1NUTjFtbGtqeHVkTDY5aFV1?=
 =?utf-8?B?ZllOelRNTTFBb0RvRmphVzJPQmkraERNMUdNcHJ0TStwQUltSmdpNXF1MTVW?=
 =?utf-8?B?R3Z6a1RDT1BNTmhGVGhiSld3NkdQdlRNcUMrVFZTUXR3RkU3akRoWXpKRlJS?=
 =?utf-8?B?MFc5c01ROWVXTmI5RFFhYUhrU1B6UmNSZXdZMkVIZnRodkhjRG1wcUhJTUNM?=
 =?utf-8?B?TjFIcDcrNFU5cWNLOGdGbE1ONlhBeUpGZ3dLWTlqTURvaTRWY0toM3I5clpL?=
 =?utf-8?B?TThDby95NVFwb1p3TGNZZlhWUzA2UlNmU3lFLzNUWmNDTHBsd1lERVd2UG5k?=
 =?utf-8?B?RDBSY05XOG9wbnB4S2FwM3NuU0xtNzh4MGUzcXY1MFQzYXZMejZsUm1mMndS?=
 =?utf-8?B?ekZVQW1iZHNlbHFlT1ViTm5YTDN0bGVPWm9rWXFaOWhBVVl3N0Q4a2RHRU9q?=
 =?utf-8?B?RERnQ3RFaHN3WEpxdEVlQmY3b3FMK1VlU1oyN3hMWkRZeFlBK29pdlNHM2Vv?=
 =?utf-8?B?eHR2NU92TE9yNE9TYWowV1pHMzBYWVhZOGkzSkpWSnhQb2NBTU05K3hqMmxJ?=
 =?utf-8?B?MEoyeGNzVk03bU5ucUE5YktIOEFTSVJHcHExUUdXM3B1eEVkQmdPa3lQUzZp?=
 =?utf-8?B?YTFhanI4dld5bjJjOGdCdmtzbHQwYVNGQWxOK0E0TDJFTHZCbVBBVlptWWFS?=
 =?utf-8?B?S2ZvbGtBekt1aGNjMStyZ1dWS0hka1FSU2V4U3JydHFGaUxxSS9wSFVQQW5p?=
 =?utf-8?B?azNlb0lhZ0JEaFhjUjZJeFdCVVRMKzNKalBhOTZpLzBxQ3lUbmd0eTFqQlpm?=
 =?utf-8?B?VGhXTitUeGlUZkZaUnFTcitONXZDNTBReXN6VWp0YmUrNVo3d1A1aWJQeHdm?=
 =?utf-8?B?MEdLUk1FYTNUN0tLY1YrZ05OOXl0cXhjUXQwWW9MV3MxNmJ1MlppcnZuaGl0?=
 =?utf-8?B?bE5LWGFmRndiMFFGcUpYUVljOG9wWWF5ZFY2R1JsVEI5KzFieWRUc3dYZzZM?=
 =?utf-8?B?WVdxZnlwYnVENFhWSFIxMTB5OENkZkNUV3AzMkRRQ3R0S2pkaXVlQ0YwdXlQ?=
 =?utf-8?B?djFraTB5TWJsUnYzYXBnaE9TcEt4SXlaSmZHT2t6TG81VmZHc0lDQnVld1R4?=
 =?utf-8?B?aDUwVUY1TnAzRUxITWtaZGJzTFlnaENONjkxVGo3L3RnNmtXYmlTaU1qZmUr?=
 =?utf-8?B?REdtcGo5dUN1cGhKdVZOWFBBS1VDbG85d3pUS01EbmtvNXZ5QUZrUFdkSUQr?=
 =?utf-8?B?dEVRZTlNcXVjWDJOdkJvT0I2ZzVPOXhHK0hHR3Z0ZXdMRXI3Rm5wTE9hTnJ2?=
 =?utf-8?B?d0VlTy96YmNRM1Y0alV1NG1IUm5hVC9NRHhlbEpCU2Vtd2d5TnJxUnlJTUdW?=
 =?utf-8?B?Kzh1L2xOZFRjQXVlbkdXWS9CT1p3WGRxWGpqd0YrNm5DL2J4N0J3enJFWGVr?=
 =?utf-8?B?czE3UXMrNnBYT0JhZEFlaEVIY0J0WlJSQk1vWFBJc0FBZFh1ZHU5RkpVOW9J?=
 =?utf-8?B?Y1RJZVBKSmw2dWtHSlk2ZHlIMCttbjVCczNjWkRBMTBaeTRGVStZOHhlL0Nn?=
 =?utf-8?B?MEZvT2xrUDFlK3IrQnhuTDZKWko5WXlIWUhFQUlMYXNWUkZweEJsL1FzbkZN?=
 =?utf-8?B?Zzg4ZjhzZ1JjZEpnVkRxeTZGU1BZTHRCYkhFcklyNlFkUGRGKzhyUmN3M3l0?=
 =?utf-8?B?Qml2Q284SldQZ1YyR2s0NHkvTUF1dCtmOTFidzZHVDdmMFN1L0ZrNUM1WFA3?=
 =?utf-8?B?RWlCSWV3clZXeDdBWGVsNkJmMVM1eEtEMENkWmNQRjI5VFFVbGpLenI5SnJB?=
 =?utf-8?B?UmJ5WTF6NXBXY0NqYWYvUVNFSk1wRUxTdUQybmYvcU5XUXlRVE1nK2tRN1VL?=
 =?utf-8?B?WUwwRFkyR0wxTDVLN2Z5RFpWR1JWZ1p1MnlPM3ZvakhGRTFtWFJ2c3c1cHAr?=
 =?utf-8?B?UHQwQ21FbXBPUGtPQ0FyeHJGSEVmS1hDSWM0d1hpbTl2SXlNZnp4YUJnbTI4?=
 =?utf-8?B?S2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDdVUmpMZjFoQ0VZM3M3MHhHelFRT3c0cmhnVkpPelNVUWk5b2E5OTNWMXkz?=
 =?utf-8?B?TmRFdk4rUHhpN1l6NVJZYUowdE1RdW5pQUVBd1Jpd2QwR2xKc3dmRjZQeGx2?=
 =?utf-8?B?Z1NZbERheWduQWR0bEhDbDdJZEdHaXQvMTV6MEFRM3p4K3lPa2xSN09wd2NC?=
 =?utf-8?B?ZEF0VEE2MWExRmxCaXJjOC9GYXBXMnJFWHhYdDNoM2t4SWp2V3o5OU5yZllw?=
 =?utf-8?B?NkpyMlRMTVRLazRGK0lNK0JEMmlNT3lBL0FOZ3NkaHZjQS9WTUswMGJ4ZDUy?=
 =?utf-8?B?b21wL2t3elJqQjNIZWhQMnlDai94eFZDU3hmQyswOGttNVNLR3pBeHlkMk5G?=
 =?utf-8?B?T1RYcUJmME5FRjRJdXpRc3JYdW4zN0Y3a3RYcm4vN3Q5RTZoNFE2RjZQMEh1?=
 =?utf-8?B?NWZDdU9ucFFtS1NVYzAvMmg5Z3UyZi9PMWVzSTJtSkI2cWhaUmREbTBSckJK?=
 =?utf-8?B?TlQ0Ynd4NG42dUZqQnJxb2ZuTGdkK3U4WFlkUTlCQlpJQVhNU2lRdXQyRnh2?=
 =?utf-8?B?Yjg5WWZtWFp6T2Y0cTB1TnZtQUpIdzV1WVBZRFp2VlYvbWtyWGxZaThhNnlk?=
 =?utf-8?B?L0taTVdMZUtwNnA4Zmw5VmNjSDlWdGtUaUwySmNuZWx0WHdKaDJNQkRvZERV?=
 =?utf-8?B?UEtEcmh3L0EvS2s5cXcwazkxelZ3b0ViN2tkRnE1WDJFa2RsaWVlRkU5TytE?=
 =?utf-8?B?S0tlZG9tS2k5dXFGdSttSzNqV3M3RWdTTi94bXl5ZVBqbmhIMjRCNlVVa0Rl?=
 =?utf-8?B?OHhVbVlIQVlhTHRrR1dTdnh1QVVOYnhMcGZoZ2pwQjdJTkpRaTZmdlA2bDNW?=
 =?utf-8?B?aTVBdXJBc3FmL08xaXRqdFlEbzlXcW9XSVlIUWY1azVPNmQyeHdBR080SmRB?=
 =?utf-8?B?V1BzMU02b0JTOWtYV0pDRXcvZWZIZ3pjdllzekVRYks5M2l2TkdCaXhHU0hl?=
 =?utf-8?B?VzUvRDhrSFJMZmMvRVVzTlRBczFxdUdtUWlpaDFKcTIwZ2RWdWM5c3JBRGZH?=
 =?utf-8?B?Sm15YmlVL3hJNXpwdVVGeFNmanpKMW1TZVI1TGpLM3g0d2RtYWYxU2hRTmZZ?=
 =?utf-8?B?M2IvTGdKTW9sa0tBa3dIVW5GY3hEd2dwNWovUm5PQWlyVXprZ0xVV1NzVSsw?=
 =?utf-8?B?dEdHRGZnVm91TnJUR2RrUC83WUlQQ2VSMDgrbWJaVEQ3WGlPZlRXczh1b2Z2?=
 =?utf-8?B?bGhDVFJHcEsrM0lieVdpQ3VVWXNBcENuNFk5eGsxcFZhN0Y2a0FNS0JWb0NU?=
 =?utf-8?B?c0M3dWxDYkJCYnMyL09hL3lKQkxoL3RrOW9TS0NJMStBQjFYeEUxeTNKUGh1?=
 =?utf-8?B?aW5OSWl4TkQ5U0cySnFPMnhsVG9VSnBXOUVFYzRrM29yQy9mcUsyNkhKb2VI?=
 =?utf-8?B?YmJicS9EcnVla1lIK2MwZk9MaCtoTDZFMVdKODRyVVBCd0FNZmppTkdmVXp0?=
 =?utf-8?B?T1FVRUVESlQzL2V3RDQ4S1o1c0RmYmthaDJiSDF1Wi9sZEg5anlpdnFoWEhw?=
 =?utf-8?B?SmFIWUtZR0ZlQS9FKzBMSU9WZC9YbU5MaXE5b1dhcHppLzd3YXhUWUxLU1pX?=
 =?utf-8?B?TlZpNWVldm5iY245SzRzZm1CV0o5cTR4VXA2QlUwVGNMc3ZpRktjVlZuNTJ4?=
 =?utf-8?B?ZStHeFYwWjZ5ZEw1ci9zYWQzbWw0cDJQNFpxdTIxU3VUa2haamxQeDBHUTll?=
 =?utf-8?B?c1BUTkRtMjc0Q1JEUWVGNFoyM0E0N0VnbnBZOEJtM3ArWXJ6RzNwVnRaOVpF?=
 =?utf-8?B?TzBOTGFmNHRBaWRBcmhRK09BNlVrZmk1OXNPb09JQnU3RnlvTkY3ZkszV0p2?=
 =?utf-8?B?YkhJOGNqSUJPSnhtSU5UZG1wd2JDc0paenhPbVpRbjVWSGpwOXlrQ1BtT2h2?=
 =?utf-8?B?NVBVYjEwSXNPaUJtTitITm9aNHZVd1BvRmlDZDVUUzRPODBuWWQyenpTZXFx?=
 =?utf-8?B?RXpFLzFQRGNBSWxNcFJmWml1N093Rm95UXdydjVxZ2lNYU9LODVjNk9SVXVk?=
 =?utf-8?B?eWFCUDVBaUVMbzBDWmQyWitveUw2T01LU3Y3Q2ZuSVlHSlA1bm8xd01nYUl2?=
 =?utf-8?B?WFgvUkFEZHlqVm1ickRQTkNCNDYrd2hzOEZ6VHl6SUdsY0s3UnN0NG53a3Vk?=
 =?utf-8?B?K1lhdXZta3o2cDRxbkxwa2tkNW04UWpKT1I5a1JwdWpGekgyUjd1cER0bFdH?=
 =?utf-8?B?c1N5bTFYSllOZ04zRThoVjlpNzAwQnRRaW5nSmdwVUszNDdvaUF6aEY5V3V1?=
 =?utf-8?B?VU5NVzlTOGlITFNVenhlOVhYajk4cFN0MmhXRitseGR3NDRxVDdKWTZIMEZo?=
 =?utf-8?B?dmNjWFhDSXl4WFNqdW1qZFFDZ1BZQVpvemFVMHN5Z1oxQmdRK21Gc2lQV0k0?=
 =?utf-8?Q?yRBSnHARrwn7kMs8zplsw57hdE6ILlQAcfu+pTDh1+dSA?=
X-MS-Exchange-AntiSpam-MessageData-1: 7rh4fCqTgNI+lA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394b3683-d522-4f2c-20eb-08de6d3226a6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:30.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jBrYUmWp6t3hrN63MENEDowmBDSMnwDJPUNU1z67YV19dEhgz7BSYF3+uw1XaSUcbODXFAgpYsCz1Crl01+Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

By providing the required `IoRef` implementation on `usize`, we can
leverage the generic accessors and reduce the number of unsafe blocks in
the module.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 103 +++++++++++++++++++-----------------------------------
 1 file changed, 35 insertions(+), 68 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 6da8593f7858..053c6385842a 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -277,6 +277,25 @@ fn try_init_default<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
     }
 }
 
+/// Implements [`IoRef<$primitive>`] for [`usize`], allowing to use `usize` as a parameter of
+/// [`Io::read`] and [`Io::write`].
+macro_rules! impl_usize_ioref {
+    ($($ty:ty),*) => {
+        $(
+            impl IoRef<$ty> for usize {
+                type IoType = $ty;
+
+                fn offset(self) -> usize {
+                    self
+                }
+            }
+        )*
+    }
+}
+
+// Provide the ability to read any primitive type from a [`usize`].
+impl_usize_ioref!(u8, u16, u32, u64);
+
 /// A pending I/O write operation, bundling a value with the [`IoRef`] it should be written to.
 ///
 /// Created by [`IoRef::set`], [`IoRef::zeroed`], [`IoRef::default`], [`IoRef::init`], or
@@ -371,10 +390,7 @@ fn try_read8(&self, offset: usize) -> Result<u8>
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 16-bit read with runtime bounds check.
@@ -383,10 +399,7 @@ fn try_read16(&self, offset: usize) -> Result<u16>
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 32-bit read with runtime bounds check.
@@ -395,10 +408,7 @@ fn try_read32(&self, offset: usize) -> Result<u32>
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 64-bit read with runtime bounds check.
@@ -407,10 +417,7 @@ fn try_read64(&self, offset: usize) -> Result<u64>
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 8-bit write with runtime bounds check.
@@ -419,11 +426,7 @@ fn try_write8(&self, value: u8, offset: usize) -> Result
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Fallible 16-bit write with runtime bounds check.
@@ -432,11 +435,7 @@ fn try_write16(&self, value: u16, offset: usize) -> Result
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Fallible 32-bit write with runtime bounds check.
@@ -445,11 +444,7 @@ fn try_write32(&self, value: u32, offset: usize) -> Result
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Fallible 64-bit write with runtime bounds check.
@@ -458,11 +453,7 @@ fn try_write64(&self, value: u64, offset: usize) -> Result
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Infallible 8-bit read with compile-time bounds check.
@@ -471,10 +462,7 @@ fn read8(&self, offset: usize) -> u8
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 16-bit read with compile-time bounds check.
@@ -483,10 +471,7 @@ fn read16(&self, offset: usize) -> u16
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 32-bit read with compile-time bounds check.
@@ -495,10 +480,7 @@ fn read32(&self, offset: usize) -> u32
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 64-bit read with compile-time bounds check.
@@ -507,10 +489,7 @@ fn read64(&self, offset: usize) -> u64
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 8-bit write with compile-time bounds check.
@@ -519,10 +498,7 @@ fn write8(&self, value: u8, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Infallible 16-bit write with compile-time bounds check.
@@ -531,10 +507,7 @@ fn write16(&self, value: u16, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Infallible 32-bit write with compile-time bounds check.
@@ -543,10 +516,7 @@ fn write32(&self, value: u32, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Infallible 64-bit write with compile-time bounds check.
@@ -555,10 +525,7 @@ fn write64(&self, value: u64, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Generic fallible read with runtime bounds check.

-- 
2.53.0

