Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013024.outbound.protection.outlook.com [40.107.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DF45BD66;
	Wed, 21 Jan 2026 07:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980270; cv=fail; b=Ai3H+eFrz+k2noqpBxFg8mKrtee+Zelh/TeU1rVIEGOk9X6yj4GZ2HWzdmS6H0zbAHUrVz9LGsnYzifBAewDegOyC9y9fu+E2VbL9UeJb4cxeU8WjG9Wr9QfD9ZSUKo/6mBfBwxnJNGhQQAjYSIlRKg8KozHi0FLt1oksFKDhuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980270; c=relaxed/simple;
	bh=w1cn8kq/BrGoinnMSbJko0juqVpYOQHJtsllBiFWSFg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UPayUgS7tE1QbmdK9APx5DOEcHONAAzgXyRJHQcB+qF5xbbQNkamvZAFlIJkfWGBrv5Lau/keHFRlFII753UApNfSJ3+aLVn1D6M9IYJlq6lxlolkNZ/8l9rB5nknPLWFH89To6mm6l3QeEswxgF9V/orwE3TOcu4NnOhswfNzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jxp6KMXH; arc=fail smtp.client-ip=40.107.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jxp6KMXH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVGbYQpVyA+OVeCd+lx8BkdmrIDCuHQBSAYKlm1IGY2T2sT82VxZ5ijg/LkpE9m4wxzbFeaNRn3jxp91CpX7djBlLOMtxnt1SY7hFsWl8dzE7eJgry/dJx/MjeOuo/2t4yQzfjqm+FmdGFTfe7VzvvprrHWW388jBAS9hj5TzltZbeNQNcENOHXuuZk6DprZI492WTtla11xBOEOMrMpg8TOPXaTzfnHXj9ycYHd1FyJ6ssKwU81CgHWp9HUYJYxysYUCqccfRtCSHZPW6H8j+3eml/FsXbwJGfGBboUBpec/fpK6OUySBOO94sftFkTvrWU1jPvivojGInKG0DCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ6GPSb2xvEbZTbYjfsUpd4o1OXGcJfKeVrmQqld0+8=;
 b=hQQVd6mEjOxegYOhp1QX6sV85oLNFqpcSxC15wjr4mP+TB115kAE6W2N1Bpx4N4IkrpMIKWNrxtqTOz1eCTXjktG2X4+NyZ0e+BK2a3P7xLq/rewfCq7E2jM3l6pQFtpzwlnCIAUerrbG8lRd6QOL5dDFxcMwxfwdqK9/r07x5IqHKGjjS5DqhcO3+7wF47hpWYc3GWVeCKcz6rGNJKp6LdiAicVC2tHd0hGxInZ3fe/8GYJDPIPVXE+G90ZfuZOsYSFAsKdyYGSwQlIjX8xOyao9qILLmZ7TdKsTzR8nSk/IA/N/Vtsury7uxryXH8m8sb5WBjbTGefDdXfo4G48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ6GPSb2xvEbZTbYjfsUpd4o1OXGcJfKeVrmQqld0+8=;
 b=Jxp6KMXHoO8oY6VWG4/d4fA0a7SRu5ZRtc7vSb/MawQeOKJpVdrIxQO8yFWAHMYQarvYBptDQzN/12ZN+UWgkHL2EHKmbtoPWct+McfdvZpR6P9f+L/38Uftw2wAgwjLhl+G75CkEVBMxQQnAlIZaPc9pJ6D/3vPH7XUSBmvf9FvmvieCUuaYUa9CzsSEZFXfFdDLRcyAAqmiwW3dnjeqM+m518X7ZqRraBtU6ntiSLAvLU+loOpwRzDc4RPkeqoj2i11fxf8WPGBvXIq0sEppQLCnOKt2L06MKSYiFmyTtzDr65k9p8nr3+DG5v+tXHzGYjsbtUDgmUSClMMjsKtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 07:24:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:24:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 Jan 2026 16:23:55 +0900
Subject: [PATCH v2 3/5] rust: num: add `as_bool` method to `Bounded<_, 1>`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-register-v2-3-79d9b8d5e36a@nvidia.com>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0057.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5c686a-1241-4831-ea01-08de58be1b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1Nldno4RzFrL28wSVFFRmtxUWxFaEhHZHUrbHRmR1Q1RmtqcVBoQWhaRmRj?=
 =?utf-8?B?djlhK09UQ0RtVnlER2k4Z2h1bGNlL09MOUpSKzVzci95c25RR0l4ZnZaYy9n?=
 =?utf-8?B?M0UyQlZlSE5rQXhpUURac1ZHWE5VSWNXMmd4c2pCYmc3UW1CL2lheENTTHp4?=
 =?utf-8?B?RG1zQ09pY2xyR2w5QklLNmtja2VrU1d2Z0NUUlAzdk5ySjZDczQwZURJQlpR?=
 =?utf-8?B?UkZqMWs4eWl3VDlQclFLNWptSFRIMTdweGhIUW5lZnFLbkpvUmtJRVFVbDFM?=
 =?utf-8?B?akYxdlgvTHN1d0JyS0JHT3RXS2ZpT3ZJTGEwWVNMMFF1b1YxYjlNSkdXdXZH?=
 =?utf-8?B?djhkQTZsSUF5UnJHclpqVFQ3bUV2dnNXMkV5cUY5VHd3bEFjeld3VTlkbmx5?=
 =?utf-8?B?ZGVOTFlDeTlFZ1htTkRrSjBKR0tYbXdCb0VUMGYwR1NjY1JpRThUa21oZlNM?=
 =?utf-8?B?RHBPRXVIUmFZaGNmQ1BtcWVqRXRaMFZCdU91NlhQemFYKzd1SEFnWERDRHE4?=
 =?utf-8?B?Yk53dWUwaktvL3hCaFJSWVN2VUNGYy9FRHhEc0RIVmsxaVRKNlc0c0kzekcr?=
 =?utf-8?B?TEUyVWN5N2JCOUN4TjBkUngrMXhUQndwYnFZcWl2RS80UVMrRWVFYTZqTUNw?=
 =?utf-8?B?RUk2VmlVVTNETmV0Z0FwdDVmY3ZEeXhJZEdNMHB0WEJRR2ZrU1FMRWsvTFJ5?=
 =?utf-8?B?MUhlT3dUdGRsQ3MvQkp2SWVJekZ5akEwYjNneTE2dGVROWJBb2ZCUERzUDBk?=
 =?utf-8?B?TGx4RDJ4KzJrQVA3YzlNUDFJMlNncHErZlE4WVpucDdiZndjRVNwNk1EMjhT?=
 =?utf-8?B?c1VnbWVwa3VFWkpRbDlVMnNoS3FncnZkeTM4STZJMUpFOVcvYkYzcXZEK2Vs?=
 =?utf-8?B?Qk8rQWxrWkdWbmRsakdMalFSUko5ZllhaXorUHFRNG5oNUZYck1kTGk3bnJl?=
 =?utf-8?B?RzZNRmg1UXdTQUF5RkhmSmxKZm5uNy8rcHB1UVNLSUdlNE1Db0FjWXJtdzZp?=
 =?utf-8?B?eUR1bHc0endXRWNiSlZRUVRCUkRoSW93SmxqSW5wMEVnSG1vYmFUZEVkc1la?=
 =?utf-8?B?T3paNlRBRnR4elJDaG9VSnFCNnpkNHJ0Mnpvb0d1djJadk5JNHNjTzBwYmsy?=
 =?utf-8?B?cDNZNnRUNDhPM2ppamx6bDRlelR4bjA4a3pTd2hRb3cxR25lTzZPWUc4SW5W?=
 =?utf-8?B?RUJGVzJBZlBsbkFGRzJLN2grMkVRaG9rdE1PRlZIS1ByS0I2TFA1dVJCZi9D?=
 =?utf-8?B?NXZJYnl1ZnYwTUN3aUdNZXBRZ0ZxeHEwMFB1VjhWTUZpV3BLd3pRV3ZaQUhp?=
 =?utf-8?B?clBmcm5NdzhqK2NxV1ZNaFNydnIyUVFkYit4cVo1bzI1aXpVNmN2RERKQVZ3?=
 =?utf-8?B?dSsvWlVCSnNBc0dGdHJZMDA3aDBOdWh0RlN4dXgvQTVEbGh2WWVybEs3ZmFk?=
 =?utf-8?B?NTJwdmFXajR1WXkybVhwcEVManhuZkxySGh1cEk2ZDZjZXN3WnR3cmFKTjhH?=
 =?utf-8?B?UlZEdkQ3bEwwdEF3WVlmR0FjU0dkWWhzMVRkRTVValBkODZYY3BMbGhGbVUw?=
 =?utf-8?B?cGlzMjZnUTNQQ1VMZCtYSE1qenp0ODlJRXpGRU1TRHBjZWxMejhURjJ6N0g2?=
 =?utf-8?B?Qi9zSHgvYW9GT0QzNTRnU0JzdzlTMm9OSU81QXBFK0VyOWgrVFVpRThHdzhz?=
 =?utf-8?B?VCtNdVNXVnpRQ3lodnJKY1NaUFdGc1hFUWFrbHB1TEFVN1Z4TnF5bWFETVhE?=
 =?utf-8?B?VVIyK0d3bExBZ1V5T2ovOUdVNjF6a01JMGNLRTNTend5em5SU3F6Vi9IR0w1?=
 =?utf-8?B?QTBTTkNwRUYwdGJUSEMxaGY2WnFieWtRbmZlVUxQM3NzY0dGRHVOWGhtZkRJ?=
 =?utf-8?B?UEVwUER5dnd2OUluQzhsZ0ROMHR0MEptcGxFNHVUWFNQY0tqR2p6dnVtYmUx?=
 =?utf-8?B?K2YvZzdjbnV5L1V2SkF0YnRhbWRlNHp4SGNUVjRCM2tUd1ZqL3k4aDVEamU1?=
 =?utf-8?B?bCtQMmVXODN2OUNKQ1FqeDEwRmw3YlFXMXNvaWl2QlpvWUVmdkI1Witwa3oy?=
 =?utf-8?B?TEJYbE1qbkVacDB5OWwvbDFKaC81NnVlWVNwRUw3NGsrTkovNTZzSUNGT0xU?=
 =?utf-8?B?UzRJRS9JK0d2cVVFMGJaNE82YngwR1ZocTlnWGErZ1BRZExOTytGU1IxWXBQ?=
 =?utf-8?B?eVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDFWM0FlWmdWeFJuaGV5YUNYYUpWM2NWWVhnOVg0U0hxWm5yQUNjWDhNTnBy?=
 =?utf-8?B?Vi9tM1grWHBSSFkvZ2paN29aWHR4eEQ5R1owMGoza1JzOGZENDZiTXdoSWV6?=
 =?utf-8?B?RE14cHdsVDgvTWtkYzJ5dUdvVno2a0lIeVNuZmx3eDdCRzJKS2RDWDlYWTFp?=
 =?utf-8?B?QkNjdHNiWUpXcEFDQnIwcFZiM21tejZUMDNjM3ZKVGFBUnIzV3ptMTRWaDd0?=
 =?utf-8?B?U1hYOHN1SFc0ZVVwK1RidGUyMC9VVUhuZnRZWFVON3p6amJVTHZTaEY1dmpP?=
 =?utf-8?B?LzZtT204UHFhYVN3dGhlTUdZTktiQzNmdGwxRW96SXFncTVQTTRmeFBTZmlU?=
 =?utf-8?B?MVRDWlJ4NjB4bGQxRnFWWUVpN1c1RGM2WENQc2QzZDQwTXRZdm82MHhzUmFs?=
 =?utf-8?B?cCtKUFZxdWJLM0dJUDJNV2gyZHhyVjBjY0JhNWY3ZFJsVWZTNlJ6S0w0cEdX?=
 =?utf-8?B?U0JJS3pwU29ZR3YrUncrTS9rNHh2cXM3UXduTjdNU05aZnFVOFp0TzZPZm9m?=
 =?utf-8?B?NFcwTnNFanBKdEZ1bWR6dkc4YVNCUTFSOVdEdjJGNlM1VE9VVzV4emZPSy9B?=
 =?utf-8?B?OWsvWHpNY3BtajJRalNLVzlIMCtqUkk2ak8rS3lyVmlkUGpWaGZMVjhMTHVK?=
 =?utf-8?B?SmgxT2k0RDAvS1Erc1VlblFVL0o3QzV5aGRCc2lNTjREU2t2WDExdjVMM2d6?=
 =?utf-8?B?N1RrWXphS01zMnBNWGJJYjJ1RjZtajcvZ3RoVGdBZUxJUjI3c0V2QTdtSE14?=
 =?utf-8?B?bUFaZFloakcyZ2VUd3oyZXc4K1QrNy83emppemhONXFQMnVNV1kwOGR3bVdj?=
 =?utf-8?B?U3FvRENaa1pxSVlnZ0RMaGRJcFVURmJkVTFjVjJScEtqaWNvYkFzWi9UQUU3?=
 =?utf-8?B?ekhzM3gzSmF1K2JiR25mLzNzMUwrc2wrckFjREduOGVwU3VKUXdEaDlKczFx?=
 =?utf-8?B?OEtzT1gvWVBRMUVsVUh1L2F4UlFrNEQyU2hzVHQ5bjMwVkd1UFRYTm90ekQz?=
 =?utf-8?B?MW9YUno3U2wzdlNuS2lTZkg4MkFRSnc0U2o4c0o4dkNvN05qU0NVQWFjdWti?=
 =?utf-8?B?ZzVjYlMvNWRlWU9LbHY0YVZYU3JyK1F3MVhwK3hSTVRsZVJpY2c3dmV4VUlF?=
 =?utf-8?B?bDYvdUxiYnVMYnFIOTlmek1LOVJXV2plQmZrYWR6K3JmakRaU0h6OGJMRGRw?=
 =?utf-8?B?WWVILy8rSXp4cU9YN0xpbzFMQm05THR6dUErcWZ3QkpqZ3RXRk1tdnFhcno2?=
 =?utf-8?B?YjFXKzJqL0Z6Yjd3TXJ4WW9TczNkTmVMYm5xdEhQczJPQWN6VHppY3N1dmhT?=
 =?utf-8?B?akhxV2lnK3I2RjFIbXNncXFyZ3JWWkJ1SFMrejZoZnFlSFFuSE9pQXkzL2dF?=
 =?utf-8?B?UUpBZjlOWVhyWHEwbEZuNkVaQktBTHMrb1lCR0VDUHh5U1lPYXk2aCtXT3Iv?=
 =?utf-8?B?ZnJacVhBS2trZ20xTllqY3p6VkkwbzJhcGFZbS9NVXFQVXIrRjFrOU5PWTdv?=
 =?utf-8?B?V1I0MGRIOWd5MXZmcGhGVVR6UElsRDkwMkY5M2tpOGwrdWZscEVkTXd5bjE1?=
 =?utf-8?B?TFg2MUJ6anFYTmZheUN5MFRXVkVoVUhqWGdzLzNaN3NwQVFaL3ByNXBheDFK?=
 =?utf-8?B?cEpKMTFpZTBxdHNKT0JOT3pNcU5vZDF3UU4wUUFKNFpsZWtobHAybU5GVmV0?=
 =?utf-8?B?TThDc3dtanNrTllIWGl3MzNLT3EwU0RjY3JvQWFzRWM5MFBOV0ZjRzhzMzZu?=
 =?utf-8?B?aXBHdUFGaytIbGJVY1hPU1MxNEV5eFBMb2ZoZzg1aEF5cjlJSTlTRVNHR3do?=
 =?utf-8?B?VUVUTk5IeUhDMXByRlJNYm1zYzhqNjQ5ZzRKRDlLdVl5MUVadVpwQ3R5TkNy?=
 =?utf-8?B?TnhhcC9HVWRxd0xKOVl6R1dwOEd2ZFl5aTB3RlZLU1dmTHBmSWxPWUN2SDBO?=
 =?utf-8?B?WmlCRTJtcm9QVjB5WGJKeStVNVQzd2ZaVUhMVTRidXJLV1RONnZLTGJzK08x?=
 =?utf-8?B?azB0b0FSY0JlQU9EK2VIR21qV1hrUXh1RDA2WjJ4aVA0SExPTkQycHZ4dlV1?=
 =?utf-8?B?TzlRWTdiOWxvaGQ5YTFJbGhDem92dko3bTI3dE4zL2xMSGNFeTljdmwyYnNC?=
 =?utf-8?B?TGNJcVZmRmN4M1V4RyttK09DNkFxWFdrN25YOUFaNGhUdC83ZUdXRXkwUUFh?=
 =?utf-8?B?S3dZdzR4MU52dGU1K2tYTGRrcUJGM1BXQ2tpdHZsOFpYc1dNUWdJUmZGdHNV?=
 =?utf-8?B?dTRKTXowcnJIS1JQeTRtRTI1bitJcmdJUDVtbHpKazRVUnY5bi8zVFI5Njdq?=
 =?utf-8?B?eCtZNGVncGJVS1QvenF6RjlVNExYYi9zSXozODRTd0lLRkl1dzdiSFBEQmlq?=
 =?utf-8?Q?OmyZlykJzRb1y91I4qs8dB1y0zcVg0OMXMtuiw8/vq+XM?=
X-MS-Exchange-AntiSpam-MessageData-1: aqnPcP/poccShQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5c686a-1241-4831-ea01-08de58be1b3a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:24:25.8201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDiqQCb1ilX1VqFX+HRAttGmfjmZ4Sx9HogPomRTXdsccaoiBR7TCFCACpXSUaHJXJeH7DZmXKLErLbkVAksmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `as_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 8782535770f1..8407606f2fa7 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -1096,3 +1096,24 @@ fn from(value: bool) -> Self {
         Self::__new(T::from(value))
     }
 }
+
+impl<T> Bounded<T, 1>
+where
+    T: Integer + Zeroable,
+{
+    /// Returns the value of this `Bounded` as a `bool`.
+    ///
+    /// This is a shorter way of writing `bool::from(self)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// assert_eq!(Bounded::<u8, 1>::new::<0>().as_bool(), false);
+    /// assert_eq!(Bounded::<u8, 1>::new::<1>().as_bool(), true);
+    /// ```
+    pub fn as_bool(self) -> bool {
+        self.into()
+    }
+}

-- 
2.52.0

