Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022083.outbound.protection.outlook.com [52.101.101.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555F64C77BC;
	Mon, 28 Sep 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616760; cv=fail; b=O8aF6Yi2DYjo8CP5a4LCfZnFPwMrOUKCBGXVuVrD4XNk3l4+HEvrxUZduMmNe9hCkCxG/IIZgE6t2Ao92A0ySSL8jEs/K4i34ymddAQa8AfTF0CaQFv6G/gQandKW2Pnr88hH+VYGFAV9wuznPORZ8vNDTP/byFzbjRrU7ezbIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616760; c=relaxed/simple;
	bh=Wfj7jtKCgJJRIqn9I2PWchogNOYYotoxuoMRN1iygu0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=rwjtwaDAwxwRYTxdRXNZmbBd4bVj40Jw8+XyembqisF8mq1LztTHoNmDUGAfaNXSrM3PvaNyvYUDoCi5wzQ/cN34FU1nxZy8RQLIUDzdVIJzyiaqUrSOP7lEl2lDcBaLZijQ6NePjJ0k2doJFWaPHiDVA5sTsAk4HPI68y8zyp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=f/ODkUhQ; arc=fail smtp.client-ip=52.101.101.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="f/ODkUhQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPXJI6TvTpzLo059naVrRvTIdYWg3kVhqN1Cm0Ybf9zVxVhDcKotJXc+5dKuATTWs0fQya08l4CDwFDvfyPXiC2a42DIszf46eBAxpyUe2X+bYnlMwSQJtdB6Bx/1N9MQFLSKuaMRMqMH7n9SBu/z7P7QHwRU5hNJb0J15FabKO9KG2pNsZZWj2ZMcgSOKIhO/AZrNx9koVPaYJljOYDUJ46pValBpEgbSOzTR8jKmzUpNwWHkhvGJbvitwV0e/ZvxHAtSTAPSOSmjHEcER359W4lLkp6P6DU1tSd00RN5/g+27uGeXknverIZU4I4kKEC1HTFsKu+s6Dcp1LjPgZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpHN9MZRDM/0o0N7xiJGtxPfG/82QrJ2iOzScF4GXFU=;
 b=d1dmLDosDueSRzgKLUFXS0X0CIOdEviXhvScPvOKebDeHWKXnCkDXen8DGyc/maJkNxnhgYJg+qVOXb9gbp0SWPvYaDdLJdPxB1kzo/Q8T2jcAo2fulbnRDq7CSPEKaxPwTOIsdAtzFgqC1+hr5MnBupxG8lsizCnL2XIonsRFTMOGtH6Zqfhh8eKGDt/f3D6Q0YTIXScIYVAq7NP53rY9bSH17SbDO5YxTy9pi0XhTFOYKL5LyZ6/KL03BxSG+TPpAY9Vk0HMbpQ+o0boJUFTI9xb1boteoo3yjM31KdLOQihs3ZGFmj8hY3CYySHKTOon979y2BsYdJfSAb1iN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpHN9MZRDM/0o0N7xiJGtxPfG/82QrJ2iOzScF4GXFU=;
 b=f/ODkUhQchTIIp0ndssRj8Sr1eoxUd1gj6n/RK5kKRrJPBqfi3B6Bt7rSd1lnheLcLRBV/nwNPwBBMMfF0EQkZIkjvU9OYmmoER+rSxnY4n6p0k87+8X76Ho5M0TfR5IDzrVdMd4xZkVEAE0d8bV+la0DDAKv+LQNqySpuB2SwM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6824.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:348::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:32:25 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:32:25 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/3] rust: pin-init: upstream synchronization for 7.4
Date: Mon, 28 Sep 2026 18:32:18 +0100
Message-Id: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKkumoC/z2MQQrCMBBFr1Jm7WCSgjReRVwk09GOi7EksVRK7
 26i4PJ9/nsbZE7CGc7dBokXyfLUCvbQAU1B74wyVgZn3Ml4N+DIC86iKCoF81sJfc+DjcZ66gm
 qNye+yfptXq4/zq/4YCot1B4xZMaYgtLUppKYj/+m8lpg3z/S/9a/mgAAAA==
X-Change-ID: 20260928-dev-pin-init-sync-93e81b019c3c
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790616744; l=1027;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=Wfj7jtKCgJJRIqn9I2PWchogNOYYotoxuoMRN1iygu0=;
 b=ZCQ3ClMXzUs7nV80LvfCSmQc56jJrnTzdaEpaoRanHObElEWTO1QhtjaSHpdGV9cniLH2a5So
 5/qylGDWuvFB4QRkfsf6egbOeLdDxf671Lyakedwv/y/cPbjSKXgJRm
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 532fedc0-4980-471d-31f3-08df1d8675da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|376014|7416014|921020|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	XZOmG2/O4k9ULBJz6l/Wu7Ddaz8tAovVBcXUTtwmfRYfj9RcP9QxFkTmikZ1XTi8df3D1fVUEov7RBxTcFJbjpVriLZrYumnr/CDNuF2dd9hR+jsjl9TSFX4bs5FZ2+mqHz2TIpWpmDFgMD250KbZPKUNSBxXyaAIkn5JM37pStmJ5TFecVpg5MP73DT0wMEgJmhZf8VRroM/XWtNoQ0M4vrG1092qVulNsoGVKNjuNrzXss4kF6FJfVPc2JCfGU9Q22lbns5aaWK5wgcb2622bFCpWhTC0oTjUVlh048d6fqb4jmkFxJonAsiYMUaHb4wUCpZnddK/fcpZtCeAbII7sz4G+US/tpJEoCzV/BQU87lg+V6ifRViCIZDBjIlyuZqnCpwz/S5aUs5KVwhQS6+xEoTqCZBZw+l6rn3bj5GcAa+7F5zLwSISqV/SH3KcOuJHdQd3j/58MmwiE5RCKCW3126RgYHjIffZKx2qiw42bJS7QzzH3end6H4JT6Y8KjPrKvOeEge0mPMtePGprToLTExQOpZhQkNrktiJuawiygv/FuCkEh/StIdELqnEYCZiO7TpIjWDYeDoAKRUII60uJcopvAv3Cc1qFljHv3BFCsFvDzwmT31eE3hqKQYIbPT6e9im5Bg59Bney3zuJSssGmzKhXz0FUEHgDAu5xIjEt0RAR4ypGmoIo/l0HyWQtKxGZSkPZDJBrNEovmmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(7416014)(921020)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0RTb1pCZzBRMEZTTk9WaUg1RGRmUE5aL1ZSQ2NMbFJiaEt3VUxjb1ZYQ25Q?=
 =?utf-8?B?Ly9CRHRFUzU1cDhPN1F4WTU4NndjNzRqK2FaTm03dGh5b0NhZWpES0lVNFdY?=
 =?utf-8?B?N01OMUdyRmdhWTZwdGROOERQMjgxeEp1dXJNMjBXVjFTalVYMFpxb0Vra0N1?=
 =?utf-8?B?M1NwUzdiUXFuYmJQOHAwOGI2ODI3a08xMThZcWFreW5TemVLOVVENVlKT0xy?=
 =?utf-8?B?Mk43OFB3eDdiekZSNkltVUJKNVBMKzBqWTRLWFQ3NlV2OXJGaHJCcWhja2NM?=
 =?utf-8?B?NTc4aTZ1SFJEY0R1Z1dpa1EvY2xNYWJyaW13ZmwyVGcremVaYm1EbWJMQVVV?=
 =?utf-8?B?SjhHaFJsaE9qbm81VFJsZWEwMHJTNnRad3BNUlM2YkhKbFJIRE1TR243d251?=
 =?utf-8?B?WWdOcnJ5aSt0akV4b2lSYlU1VFpKbzdnbVhwczRPVGJVVzl3TXVNTko4Q3lC?=
 =?utf-8?B?RFVCMG9VSGI2VTE2QVVmTHBwMTN1V3ZzYVhuYW1yMXhteVArVm8xdVFhMWJS?=
 =?utf-8?B?cE00Yk1xYUlkRXUwWjk4R2IrQmVlYm9NUUpFL1loSHQ0RndlS25DU21PZUh6?=
 =?utf-8?B?aGt5dnlJYkVCZVlsc043N002VkhoVVlHL0VqdGw4VkZxVTE0cEJ3SkF4dGMy?=
 =?utf-8?B?cDdDcGpKUGRqSFE1cC9EMzE5UUF4eE4vSm9qUHl1dDg2OGpIVndZV3dBMXgw?=
 =?utf-8?B?TzBJdjc5dk9RVFBNSU1zY0hGMk5jWVhrbE8xWk80T2xXZUJyalNsRVlTV3FW?=
 =?utf-8?B?dklSaUdiL0JLazNRRkh3djRzNUhlU05Edm9ZdU1YUFBXdjN0eUt0dXRrS0tY?=
 =?utf-8?B?ZTg4T1hLTFdWejJtZXZrZk1McUxJenVlMnBlSmtkaUYrUnZHTldRZEQ2ajBI?=
 =?utf-8?B?RXJ1MExOUUhmaTArdnVUclBNWTB2QnA1YmdvMXF0eE5BeVRyUTlJUStCOU5a?=
 =?utf-8?B?bG9raFBvRG03RCtkeERtWU1mUFBDcHJFYTMyckN5dzhOS0tnWTErNGE4Y2xB?=
 =?utf-8?B?N2NnbFVNNVRnNWpEL0VmZlc5WWVnWUduNjFoRFZxS0RlVitzVWVCeDMvbito?=
 =?utf-8?B?Vk9kSjc0S1VzZm15NFFnYnB5K3JqRlF3SVVMYldCRHJRQlBGYnlpYkh6cTFH?=
 =?utf-8?B?TmVvanhpMFIxUVVqODEwZHI3d0RMbFFxK25yczVzTkxYaWlTNDhiV2NxQUNB?=
 =?utf-8?B?K1ZFL3Y1Zm50MEpxTURIUlVmUjdLaU83SW1TMDJxY3UzNytBSnIwN0JBS0Q1?=
 =?utf-8?B?d0hTSmNvSkNIMnJkRjhPY09KRDhRb1IyV0ZiRUt1WElUTmNrZXNuVFRXQzVl?=
 =?utf-8?B?WXcxOXBOTTJRNzZvMGN4M3VmaFpJV01Samxaemd0OVRnNGM3a0s0R3dCQWpR?=
 =?utf-8?B?dXcrcjNZbjhwN242RmUxTUNZTGhhVHNPcHZ6dWRLRDJvR25zNDN0U1ZXMGgz?=
 =?utf-8?B?WFFYZ1NuK0J0Yys2R1hhdmVOZTZBUWlieTdpUVk3MGRUdHpDRVRMZ0hIQlNu?=
 =?utf-8?B?TEtjSi82cHNQZXlqSnNIN0VGaG40YmNHakFTRXVveG5Zc3BHRjJ4aEZHK1ZU?=
 =?utf-8?B?TEhGSWtFUTduN25YTVJidDQ1UkJxVkk2aGZKVzhBbkgrMHRCQXd0MmE4dWtJ?=
 =?utf-8?B?Rm5LTjJGUGFCSUFHbEtUM2EzSGpUTmtsRTUwRXJSajFzYkZzQUduMVlJVFly?=
 =?utf-8?B?bVFGcm9udjlYc3MrZk5UN1NZR01WOVVNd2hlazk1Wm1UOEZmV2w3dExyTmpp?=
 =?utf-8?B?Q2dackhpQkFnR1F0d1ExdkwzZHBpUFpkcUlsWE00cmlVZy9aaWdOZ3RDbUk2?=
 =?utf-8?B?cFNUcVNna2E2ZlF5MzAwVExLRkM3TThiL2NyOTBXRitOdW53bUw1eXhUTmZD?=
 =?utf-8?B?T2FVSWVpTEZ0bXpISzJ5dFVLVzArK0VVUFU4SHBRZnNJdnB3U2FJN2RwMGY3?=
 =?utf-8?B?YUtuMWU4VzNZaXA0OERRL2d2czNQR3lsaFhMWDIyaEZmR2ZhWHdWdEFPcVEz?=
 =?utf-8?B?Yzh4MWZxYzB0ZHNUSXZsTkpmTTU4RU0yeDlPaWxBejVmQ25GcEVVUW4rd0Ew?=
 =?utf-8?B?dTdNekJ3Q3VobTI2eTRxektSbmtPbDl1Z3JIVytnL3QyQUc5TXhzbmN3d0NY?=
 =?utf-8?B?TmRHRE5maGtBSDVUR2ZrUzZqTzQ4RVY3ZDFVQ1VCV2s1RlptaFB3bTBHVUxT?=
 =?utf-8?B?eWJUOWRaWWc2dmtuL1R1RzZibHRIZDR0bFQyMk5HQldMVXpGVzkxVG1ESk53?=
 =?utf-8?B?anpwOE85cE9ZSVBoV25PVDFqRk5zcThRQ1lscmE5MnpmWmtHc3ltblFTYlhl?=
 =?utf-8?B?bVFGYXRwcnY1VExGTjh6dnBYTGMyam54SnRHamVOYzhoMHdEQ3YvZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 532fedc0-4980-471d-31f3-08df1d8675da
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:32:25.1226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra5wGIVL+9VoijyzwEKNYc3vU8tcqJsIIdxCQqmraIvmV/Trq31gyHja6cRIqDTbroi8yRc7CnqegivIy3W/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6824

This sync series contain two upstream PRs:

- Several additional diagnostics improvements
  https://github.com/Rust-for-Linux/pin-init/pull/179

- internal: init: allow reborrow of Pin<&mut T> bindings
  https://github.com/Rust-for-Linux/pin-init/pull/180

The upstream PRs have test suites coverage which is not part of the kernel
tree. Reviews/testings are welcome from either GitHub or the mailing list.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (3):
      rust: pin-init: internal: init: allow reborrow of `Pin<&mut T>` bindings
      rust: pin-init: internal: init: improve diagnostics from field checks
      rust: pin-init: internal: init: use span of `<-` or `:` for the init/write call.

 rust/pin-init/internal/src/init.rs | 106 +++++++++++++++++++++++++------------
 1 file changed, 71 insertions(+), 35 deletions(-)
---
base-commit: 95593ed3616194c9498cc190cd1a3693ff4bca37
change-id: 20260928-dev-pin-init-sync-93e81b019c3c

Best regards,
--  
Gary Guo <gary@garyguo.net>

