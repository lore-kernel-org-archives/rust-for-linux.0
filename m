Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D634FF61;
	Thu, 29 Jan 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693560; cv=fail; b=fh7b8VbB5j3BCuCynf5uWTUKTU6D3z9HVK4UVP5ThJ+lpmThw45FG81FfWt6N4Lh6UL2i8Zwp7FEJd96CbQWK38d+JTyRf1qbMXchxVjm2z8SH/as26yv7FzyE8/uD1IDWQZ3xuHqUkTVvkydnmi9O6sxojTykNFNTe6gjmXHXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693560; c=relaxed/simple;
	bh=6MiXBt4lDx3bpMkX0Lw2s942vGdsWZGwxkBHCJOfzCI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FznbLWsHcEEq2tQjIdvj08GK1Var1sOqrSSSJSaiEw6WZR3oNy0PaA1kz6GwKD99tbLalvROfL7h4TgCDPjJEW2riDDmWg0TCdWVpMRRHJE8J4MzbmwzuA0ARbcteyNJMqDGFHI719BdZQyTwQqM/haXWjagxRjloH0TdA3O7SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TCOL4Nux; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TCOL4Nux"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqghel9EmOSnxnH1i9hmYwtO2lKp1cLk5YcWYRypOd4Eaqc9MK+GSO3c60i6Fvjizmx6+zsefncEgXkRHQOz1mjtuTk2evZuePTgvehZP/aNsjhRp90+KadHdiTtycDtu4CF4JwDTB9L2DXuxNeLtbG44ej+JGpryh9RZw81FkzXjtWBRSTg/WIOruj58bYUOBxdfKR8SbW3Io4dF0yKOE7TWM0UqXFneMxad5ikDWk6fcMRdpXZWhW91pXY8JWSVu0vIdaKzmp80XD7jCw4cjHNwq/41NIUHm6WTdTuEv4H53RhEH5Rgs3kG5NZJ04yqx9w1Zp8qI9Ps93KMjYycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erNDtKyH6VHGO5jv2oZNK/1Ju4ma6zgs1RHsz7tXJS8=;
 b=WZZD3nXhcOch7xFjTuyLO95qo3y4Nb3tO5urEk+oP30wnBNY1DcLGGNvg24pf5iCx7SG6c/79Ok4v9k1+wnGjPe4LDChcAtHzLU6+5DWeLNynJhbthuw4CPKCcbp9tjduLO9ti9DqSIxuA3seO2eVhi+NyqpgNKB1dKJ+MqHqDBPM/k2N06ebgHDZP+DmSU3im7G4KwISrR9N7JGpJWktQ/L8A0jI9RYjeI1+dA0rRruMfL7Tn85JQBPD5aAth42W3GHPYuYe3dgahFyHgXv1O03VfWWkq4xnFqQxUqEGpn1cu9C+RT3ASpF+XLoMHvMe6Ct4C98M+ubBYqxOam5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erNDtKyH6VHGO5jv2oZNK/1Ju4ma6zgs1RHsz7tXJS8=;
 b=TCOL4NuxBXHsSJFcF6J71hSy1bIP6CXLaAzhvH2rzJbiTYeScoBh01B+L8uXnkZG6Ok7YarmHV6tXYCGgUrG7uP6MPGU1mgQEk1IQPzmalSexWv3kav2vrdRcb5oOqU9BcIIYGwuvjEKm6PU3knYz9YrRiIQMGEbYQeqdbQI5Upgt8nCodnJT6f/pZ5cd2tCrr8FFVcMqxV7hpk36qlQ1adO+crqG/z6OieopJmhsHA68vmNyljQFY6AZwg68Tg9dN721S1/9LSJBMNtihgHai8nL6iiHOrFp7C+GGfU4JxXNAvm5tOI7TGgCxOCYU9F2riBjFlCGdzyVxm+XRZbAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 13:32:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:32:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 29 Jan 2026 22:32:06 +0900
Subject: [PATCH v5 6/7] sample: rust: pci: use `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-register-v5-6-c4587c902514@nvidia.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
In-Reply-To: <20260129-register-v5-0-c4587c902514@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7313e742-a38d-408d-9c48-08de5f3add1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czJrL2VrdlorZTVUaEt6b3lRVWxLeFpyQnRRd1F1TVBYRmhFOCtqM0hvckRX?=
 =?utf-8?B?cGhiVFQ3UWVrL1hmUmdsaHI3dGJnSkxPOHdKNlNieVlnaTlzNHJmY2JxaEZL?=
 =?utf-8?B?SndST2dVYzQ5MFpOZG5mTXhzZDNMT0g2SWhFcGRNYUlvZ0p3MTV0bUlnM0pG?=
 =?utf-8?B?WHNBUE1xdDhKQWZLTEhlRW1sek9nWllhWCs4M1JkQ3lxQWRQa3hvMDJZNmg5?=
 =?utf-8?B?OUluemhiWlh3UDRkdWNtbkt6bE9oVk55V3Vta3k1MHI0VkFQVzhaWGlWeHZS?=
 =?utf-8?B?SVNUT2NOWjBxWnRGZSt1ekg5NFNQTXgrRkZPRys1akllYXBsV0ZWMEFHMTRK?=
 =?utf-8?B?Q2dIK2luTkZabkhqM1FlSnpBZlBZQ0FHYW51ck8wYnM0WUErOFNwMXVSWGNr?=
 =?utf-8?B?ekFkd2llMlNwd3RIdFpKbmhIbCt3SFBVNDFsdk9LazFUUE5FT0dUWS8yM2Mr?=
 =?utf-8?B?Wm1YWVFxUXRoNWtUbnk2U1lBUWlMTkJFK1pFUDkzVXBhRXpvSmF3K1I3MklE?=
 =?utf-8?B?ZXMrTHJxc2l3MVBxSHc4dWhHWEFPVGRqR092S3EvUFlFWUxjVmhKZzJQNjA1?=
 =?utf-8?B?T3lPdjU5RmQvbjA4dWdqOElCTXpWM2ZCRzNwTEtkdzBNSzVtWC9Rdi9PVGl4?=
 =?utf-8?B?RXJ3Szc0clF5WUJDdFlhMGdLRnJ0aEViQitrZGo1VjBjaWNVTFJodDBnaXUy?=
 =?utf-8?B?WVU5NUhPRXExRFpFTEFwZkhKaEZBdWpSUjhSdkd6cGlIZ1ZtNFAyMG9yNWlU?=
 =?utf-8?B?ZUxFczlOWGliWm14UWIydG1JdjhjSXRZSTBRQk81WEk4Z1RWUUp1WlBSZzh6?=
 =?utf-8?B?SUtodUxuSUxPdTZ1ZU81SmpQZ0J3V09CMi9iSVIvVjJxenY1YWNhckNlQUZL?=
 =?utf-8?B?NG9EMnJ1bW5xZ3FmN3RYRGNKWXFsOGJIMWphRHVzTXhjL3ZGWFd2RGdnaTdF?=
 =?utf-8?B?Yzk3Mm5ORlEzOTdobkNNVlVpTmpMNHhrRjkvSGo4OE94bTNHZHdOVU42SldW?=
 =?utf-8?B?MzlFUlJRTGY2WlNkRlBOS1hvUk1oMXZNWFZteXk2YWhmVTZaZm1xYXkxSGFm?=
 =?utf-8?B?WUdaQWJsMldMejVVOE9iN3FleVdNNWVla0RFYzVZT2hFRUNxT2VSR1FiQnZZ?=
 =?utf-8?B?bEpRUUlDUnJQYkEyV2Jwd3RKT1dOdlp3MGhvZzEwY3RCS0lydXpscVErUHdl?=
 =?utf-8?B?NEpGcjc4eXlTajFEWDZhWEQ2YitqY1U0TmMzVzdTS2E5cVcwaHRPYkx4V01B?=
 =?utf-8?B?MVZDNk45a2FLY0NsZ0NuUmdxRUQ1bjA4L012YmZIOUloclQ1OHp1bHlJS2dx?=
 =?utf-8?B?UjUrckZmcnRNeGZxR2RNUHNIZk5yUGwxeU1ZZXFteS93UHFXQUVOcSt2VWtJ?=
 =?utf-8?B?TmpabEpXTG5lR1ZKN2xXZ0l6dmtHbzRXWi9uU29UQjB2THM5bGpIbVdyY3Bm?=
 =?utf-8?B?TWF2aFF1VmtJcXRmRzhkL0pwWmNYaW1CdVp3enFHS21JM0R4dEprUy9sYVJ2?=
 =?utf-8?B?M3pTSkFEUDl5MXAvSHMxdzV3SlpEMi93MlpRVXNyZW11d2YwbTdHdEJYRGRC?=
 =?utf-8?B?bFpPOHU3VW52bGMvZnBWbGF4eWxITTJSYjh4N0tXL3M5THN1aFJvNXRwU3c5?=
 =?utf-8?B?K2hNSHVvYXFPYWIxVUIvd0tHblk5Y25tdk9hK2RPNkVySHpDYjBkZDcxUEph?=
 =?utf-8?B?bVRoRVUzSHk4ODNqQ2FUTWR3Vi9yTEJnaTIvUTFxemM2ZUhVa1llMFp2djl2?=
 =?utf-8?B?WHViMWorTnhua2I0WitzNEM1SXpYa3JWWkE0QVFtd3gxUFBMVSs5Rlg0TmQz?=
 =?utf-8?B?cGI0ODkyei8xczJlTnNlc1Nvek9tUGEwNHMrZTJKZDNKRi9GYnY3eDBxWWdm?=
 =?utf-8?B?aXNZSDdNSkhoLzJuSWlQTzBUNnFuT3hXeEdCeUR2K2U3aUNPdGpTMjJpODQ2?=
 =?utf-8?B?NmNTbHJPZWdKZmlhejdiUG1LektwcVY5SnVNaEtYT3hSZmtBYnU3NFp3R0VM?=
 =?utf-8?B?enVSSDJQSWZmYkREWUhTMGVNVzdZQi9XeTQxQVBVNklMNTJmNS9HeVhWZlV0?=
 =?utf-8?B?RE9NZDJoMkUvWjMwdzRRVzdHeEdPVlp6WTZFUksxd3hWcnBzZStMSGZxRFFP?=
 =?utf-8?B?VVhIcVlmRi9reVRvU3Y4ZXdGOGRBenpMZXZyVnExR2lkR3JvOFZ1NG5KZi9P?=
 =?utf-8?B?a2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGgyZmc1amo4YlhEYmZsYVNvSkxFa2RWcDBkaC9kcnJUMWlVeXlEOWc2eWhC?=
 =?utf-8?B?ZnJoUzJJNkNHSFVrWmQ2WEZKWjVDWmpYNmhrTllzOWNWbGVrVWJ2UU02LzVj?=
 =?utf-8?B?a0wvRHFwZmFVcXpDZDlSZXIvSUM3NEpsQ2pSRTVWcVBVWlpvNituSUQrVEhQ?=
 =?utf-8?B?T1c4UDdZYkRnWTBzZStoZW5UOHgzS3QwU2JGS3FqNDNSaTArVUFZNjdNeXE1?=
 =?utf-8?B?cGFDWUVhM2J3ek9KUzFWUzNIalUwZkxVY0k2a202Snh4dzJ5Ri8zV0lnQXRw?=
 =?utf-8?B?TDZBU1hyWmtEanB0c2hEa0phZC9XWEVhU2RFODEwb0Jwd25IWURYd01VRlNl?=
 =?utf-8?B?ZHpwTnpTSHhqeFBuWmxHTjJGRnI2QTF6UTZtbEhBYkZpQlJ0TnBxdWRlWXJv?=
 =?utf-8?B?bUppWnltVmlNcGpEbzN4aTkrUTZOQzdjZG9LTTdhSU9QVnZOWEtERmRWWnNS?=
 =?utf-8?B?RzRMZUMxdHNCdHYvNXN6T1hOMXR0aE5IanhCd2wwU2JuaTQzSlZvNEF1MVBE?=
 =?utf-8?B?eXNzNWlTajkrbzNma09FTWZMakRSSFd0Vm12bmNEK3pDRW5pUi9xSCtvdW5i?=
 =?utf-8?B?dmRyZkhZVnYzTzk5V2FUc1JsOXZFZ1R3Q2dZalFmWjVKMWpVbGl5T09jcnpi?=
 =?utf-8?B?RDhMOVEvRzEzTGlFS0ZldkhxNE55MlRYbTh2RFM2T0xGNmF5SFl6WU5NL3hV?=
 =?utf-8?B?NGNOSDBTaVhDZ0lwTjlKS1ZUYjQ1ZTVJaFNmZ0xSR3VETm5IbE16YUc2Q0ha?=
 =?utf-8?B?enBrOUlSSE1tekRsZFAvSVNvTWVrYzZjdVRwY2szbkptK3Y3bEpxWjZDRGdU?=
 =?utf-8?B?dnJLR2V4R2FTY1pqaTRneTJhZy9CS0ZlbE5mNDhKaWZyT3NRdEtoN3NrdEpn?=
 =?utf-8?B?dWE3c1Zpa0JiNnhKRnREcjh3NGsrV2ltUFNDRitvWEdabVlCdFpNcU1TUzQz?=
 =?utf-8?B?ZEhPMjNlZEUyZERhRWRCS3JucW5rdFRQRlg2TDN3UVZrdWxkVHJQQjFidWJ1?=
 =?utf-8?B?cHVlbWU2L0lTOTFjUkN4UXArMVdsamxObUZEYWdBeHUrU2lUOFF2M1dIaVVs?=
 =?utf-8?B?RlBEMnQ5KzlvTCt4dHF5ZWVwTjdBSW85bnBiaFJaZUZnNmh5QUJ0MXNUT2Iy?=
 =?utf-8?B?bG4vU2tIRHcxUThMa0ZNTmsxQ3VqR1RHRzlGYmt6eTV0VER0OVh5NDZndFZR?=
 =?utf-8?B?ZWNvUkJzMkpJb2ZsbHFCOC9DMTFoVHRFSnNlTHRKbnR4RmFwSlFtdTZNT2wz?=
 =?utf-8?B?Ynd0S2M2N2FDUDEybkdibDM1SDZhc2RiM2Y2MzNqSG1sVWRsekYrUnAxdG1G?=
 =?utf-8?B?VkdPQ0JsNmhiUkJGYXFHNEFHR3pMelhIQ2dEK1MxRFYrK0ZlV0ttSWVucnBC?=
 =?utf-8?B?bmJ1NVJCTE43SVlZOXhuLy8zYjdBenBKUWlnL0U4MmhOU0pPbGwwYnVQVlFJ?=
 =?utf-8?B?KzREbFJsaFFtSHRoYnFJYmZnd2tlUkREdUYxR3BDYUgvU0NIL21VNGlCY1Bz?=
 =?utf-8?B?VG5OakNDTUxhMXNESHpVSW9JUVF2NWpRNDV3UkorcjhZb0hLQTVMUVF6SWdQ?=
 =?utf-8?B?WnIwbEdvT1NLUVVEQ1dqaFczR2pROFA0czJMTU9jdS85T3NEN2grN2lUNGIx?=
 =?utf-8?B?eEhvN1lVNlEzY0dMQThrMHNpSTg0TmV2b3RTR0VXS1JwNDVxV08vdUlkbmZa?=
 =?utf-8?B?OGhUeDc4QlJCUG55SzhtRjF0bEFIVXlEUTRJVmJWYm9ZOU9hcXhnblZkOW5s?=
 =?utf-8?B?dUl3UkdQOEZSWGZRb2FPWHhWOUFLRTFyaXd1Rjk5ZnVxSmFoTldjTlQzaHVR?=
 =?utf-8?B?UGFyeWlaWklFUnNMRk13cXA5blpMWm5NQThpYTJSbnBnUHlaS2hwenlYNnFz?=
 =?utf-8?B?aURYSExpVVRnVmVKamlzNVhrT1RzaDN4SS94VjdDUWFiMWtDNGN0bzJESmk2?=
 =?utf-8?B?WXdRRUE3bCs0dEhPeGxKQmFjOSt4ZjkyclI5SXR6ZXRsazBtY3JIVlp5VW5x?=
 =?utf-8?B?NEVGUm1VbFJTbUdlWEE5Q2lXM3Z3QnMvUjh4Y1d3NWJ6cWZvVEd4czNwY3hv?=
 =?utf-8?B?OUdieGRmOGVEdDBtSVlqMGdpTFhmUTUyUlJDL3pYMFRoOTQ3dG5wOUczTDhj?=
 =?utf-8?B?ZTRRVzFsTVl2Wk9mZW1xeW1SZ1MzZlBkbVRYWEtxMG9yUFNSbGZkR3JPSHRT?=
 =?utf-8?B?enlzWHBYYmpkb3M4OGd5MUhtWnVYQTJoYzVLL0taSXc1OWRGamoxWmFQYWV5?=
 =?utf-8?B?bW5Jci85dWx5TXZkRFNNZGFNSUdYZ1daWlhXRGFiRjdiNkhUSWxzTnZZczFR?=
 =?utf-8?B?ZFJ2T0dzNVF1Vi9GdGtvbWZ6RmxxRTBnODBhd1kvNWd5QnFqNWlrNDNXbXlR?=
 =?utf-8?Q?gsGWFbjQ8+I/S39wBKUjA4iaXLJmR0SQ0SoE5P84wbTfu?=
X-MS-Exchange-AntiSpam-MessageData-1: FWfBgPonBBfZAg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7313e742-a38d-408d-9c48-08de5f3add1d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:32:35.6901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSRp/Q37zNruLx1ohyStv1KUVJm8DQTry5yTft988EfKNNNq8vqeSHjQHFMBXabGPnO1sTAF7tFQMtz+PNJbrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146

Convert the direct IO accesses to properly defined registers.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/rust_driver_pci.rs | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 4dfb8a6a4707..df2232d6b71f 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -70,24 +70,37 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
     fn config_space(pdev: &pci::Device<Bound>) {
         let config = pdev.config_space();
 
-        // TODO: use the register!() macro for defining PCI configuration space registers once it
-        // has been move out of nova-core.
+        // Some PCI configuration space registers.
+        ::kernel::register! {
+            VENDOR_ID(u16) @ 0x0 {
+                15:0 vendor_id;
+            }
+
+            REVISION_ID(u8) @ 0x8 {
+                7:0 revision_id;
+            }
+
+            BAR(u32)[6] @ 0x10 {
+                31:0 value;
+            }
+        }
+
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read8 rev ID: {:x}\n",
-            config.read8(0x8)
+            REVISION_ID::read(&&config).revision_id()
         );
 
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read16 vendor ID: {:x}\n",
-            config.read16(0)
+            VENDOR_ID::read(&&config).vendor_id()
         );
 
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read32 BAR 0: {:x}\n",
-            config.read32(0x10)
+            BAR::read(&&config, 0).value()
         );
     }
 }

-- 
2.52.0

