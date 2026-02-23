Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9B31A56C;
	Mon, 23 Feb 2026 03:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771817780; cv=fail; b=Z8PdvWZj2ofrlvhWTlEB7KsE5oV4KarkX8v21srtYSxZEcvgEMAJQFZjzgOmxqQKeZ0tsXjJf7Td0zRDsgUHO79S+S5qOswcjHeQcxQbGkCM2QrKjbnqWoaPUd4AbbYbmVVQyYjgJLVsCL6IouLRh8V7b8zq7jTR6PntvXAIMDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771817780; c=relaxed/simple;
	bh=JM6cWsujrtQ9tSrM0eJhOrUSpEmdaZW9X0UeaGPcONs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=p7ox3YqHQHITkBYgGTMq5IlqOe/viO/DUik8H6DsrvrifIOY16l1Dj0mYcIkjOuHFT8Jq3mXLUGoZu8APUujoWExNTrpwXcW1YRUZrY9z1IcoZRjF8Co+qkNHo7NsbKJ7QFbhYayjrq6syuiLyws5vYssvephIbBP7gJ6VyuWQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PEEO68Hl; arc=fail smtp.client-ip=52.101.53.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PEEO68Hl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZG7qxB+xI3JQhm+cAHGCIws8FqxeO0nkAmY3n8c/ndjPhVf9i5eLhIi3yI3UpTsSJaiu/338HqMv/tz9LLtIkd74H8EZ/f5xwo8hlmI2sqgSWpiJRLTMuh9OvmEjKn5H3GLAbAI62Hj6nKuBFXZY5SWQwsBcbYZWapb6dLyxeHd55akwQ3Mub9u/PzpcIXTWPleVZyDAHmlULgKFNuaa0NyKROklTqjn2mk6vSQQQZafCBbnRYNxoX0WEJwcYGET2r+Td3slWle8MM6TtGFS4vbM+zvzMt0gxJJM5JmGSqMYhIITltDmRnEGC6+Qo7zj7tLiaSNxsJPrMD86YN7eGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JM6cWsujrtQ9tSrM0eJhOrUSpEmdaZW9X0UeaGPcONs=;
 b=AO4akSkS0iziN/kU290oG1olsBmr2HsDp9lJHcnmVYMUORsIlZr8EPZBUgTPV/czo2+Nkrk6V7WKl35Rjc8i6szKwLCv5OvOOgKEHBR7ul1GTHdtEp8KOzT+QVWFI7SwD6PzXZG6j16hVWvVN2HzAME5Rg7BtKxtFUkYp5H3ebEmID7TrsLaf6Afyp7VsPinj5Ip+fEKcESdkf4s8TtTR7FTqm6jjy6pkyC9isNGz8bHhQL7mNY8Opwn5oXu1rxQA1ZM417k51RISo7587C3bB2JdDrJUzkeWhcG76mE8KfMcCrOajLFKLxqllLFOCFb/1mbU0bNfRdstet1T+7SfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JM6cWsujrtQ9tSrM0eJhOrUSpEmdaZW9X0UeaGPcONs=;
 b=PEEO68Hl/ux00A3aoQASd7I24BTEJkf1R5CL8OVubdog2A1QRsO4VStaXVt8GtIHUbdmOmIJtWeDu+xJ4q5d5nX2BysnDOyC7SLgAljBa7Y6fKJsP+WlDsBm0tCTW3DHn5WnVqcKljzswqW2QLDYK8eabKMRpmskxypZoCGq2phvahzI9j0R3Sftt3GSNXHOlOcova81LG+mqc7EdDqT8rE5ttORxG/8leJTg5VuyJBDywpP/arAmS5kvTiFJvSGZEub5ip8KRBY+YKOojPaOENT8NgHaWRpVGgJ/wMWVVkEvsa+vV3HFuyAb/b6gkNdHCxcMZmiAe7/qwRqP/1OFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 03:36:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:36:16 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 12:36:12 +0900
Message-Id: <DGM0ZBZV25HO.14FE1REMGNQ9E@nvidia.com>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com>
 <86600a42-9eef-4c2c-84c7-112f5b9b2509@nvidia.com>
 <CANiq72nW3MDdBDbQyPfbc2t=5sLEhc6ThpJ-PApcUgpS3S+ViQ@mail.gmail.com>
In-Reply-To: <CANiq72nW3MDdBDbQyPfbc2t=5sLEhc6ThpJ-PApcUgpS3S+ViQ@mail.gmail.com>
X-ClientProxiedBy: TY4P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::10) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bdc9ac-6f81-42a3-5a9c-08de728cb34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnRWcklXb3FadFJuc1dFWVdMZjNWWjR4VWN4VS9DUFRFWkloaGZTa004NzZx?=
 =?utf-8?B?VUtLNmRpMDJJK1c2WDBzQSs4dWVYd3dFMlZLeW96dGhKcHJ4ZDFWeUpIcXk4?=
 =?utf-8?B?QURhNHJDZE5zOUhNbUd0anNNeFJGQlVPcDdaOUN2TTR3MXZ5NlhUbzBXNWRX?=
 =?utf-8?B?RGk0YVdDSGFhc3dIUk1RbC9Oa0t6NUxPenB5Z3V1Z1cwZ0hVQUN2ZkVsYjdx?=
 =?utf-8?B?c1Z0bko3bm14UEJNYldhdTNZS1ZEUEFCbGJJbi9BU0JBTW5FOTM1UEJWUVVz?=
 =?utf-8?B?R1JDS01OemxTSVJHKzFyVUtpTFUyb1JNZThzQitkK2dSeFU4dUVyeTlGd0tx?=
 =?utf-8?B?VTlsYTU5RjRwZUZEclBTNHQ5OHI4S1FXMEdZV2l1dDNJMUwyZjRtenRxcHUx?=
 =?utf-8?B?TWxuR3pROTVFU21saFVGeHc1cHR0c3F5MGYya1Z6bkU1SjdVSWw3dVRsMHpY?=
 =?utf-8?B?QW1KYlB5TDk1TS8xaWJBNVpqM0hsTUxuWm81QzNWa1hXUWdTa1ZGQU5jWStD?=
 =?utf-8?B?aTZ2c3A1Slp4c2orVnBEa1IvVHdlMlpRaVEvSTZ0ZHNxMU1PRFRTS3ZpNlo0?=
 =?utf-8?B?WUtjR0R5cUxCd0RJMjN0K3VGSVAzS1VlU0ZvSXR6YkV1b3F5WmhNSWUzOG1G?=
 =?utf-8?B?bUpLdFdNdlZySXdVVEJPTXk0cVdtL0NsMGI0VitmRURXenNRUnF5cDdGNnV4?=
 =?utf-8?B?K24wSjd4Qnl2ZmlJZEp1VXZvSDd5TXlIcEVSL1NXdmxNeFI0Vnh0Wks3d3Rp?=
 =?utf-8?B?c2V3cDZiS2dyeWFRSjdpTHE2ZWg4YzdJNkI2a0tjdEJXTngvNjVpL1N6QWZm?=
 =?utf-8?B?R1Z0c0lMQTVsdmp4YXhObjBGNXBSSm1leFlsemdETnZNcjJrUXlGNkhEbjFh?=
 =?utf-8?B?bFpOQTh2V3dFTXRlMlBtQXBIUVcwZlRjaVB2N1VCM21MOU96RG1MTDgyRlJs?=
 =?utf-8?B?OE16ZVdrVDZuSVVEcWdoT0dzUWR4RW5ZTzdvNE5VQ0pNZGppKytRVi9UZUdt?=
 =?utf-8?B?bUlFTUk2aHdVMDlicitxRTFJOWNCK2gxbEdXQWJBbGRiRWpOOCthc2l1cko4?=
 =?utf-8?B?YXZOeGVYd2pXcjdvTDBXZVc5OWZOTkNoZHNxNmR0eWhQN2FrSlRpTXJURjIx?=
 =?utf-8?B?YndxalQ4R2JiSkVqWFVWYWQzWVhPc2pjUXI1ZjU3TUJSM3QyZVhBdGJRV3Np?=
 =?utf-8?B?U1BxQ1NNMlNRV0JYUW04RGNLaEQrTFVCZFYxNmFkNElrS2RNRTJ4SlpLVjFU?=
 =?utf-8?B?TVZjU3dvSmxjTDZrTm9XYWE1M2hkWEZmMFJpQnRDb1VxVkc1Z3dFdkNUZkcy?=
 =?utf-8?B?OE43UnNqNGMzdkx0YXMvL2FrUXJqa2pIMkZtVEJIZ01hcUJsYVJSclhsZjB3?=
 =?utf-8?B?Y3p1QlcrczFPR2MwNEJRY3lQRTR1aU9iTEJ2eW5NdXR4VldncXYwVXc3MHV1?=
 =?utf-8?B?ajhydlh4Q1U4Zlc0RGFMNGtPZzRIVVlKYjlhdEYwd1ZNS2tjcVJJRnlnemE1?=
 =?utf-8?B?NnZsTkpkS2VjYkNBclhRQVFLVzNYZUFYY0htWHVzK1hRQWNoemxaZDZ1ZDg4?=
 =?utf-8?B?bHpBbndiMG1ZVGt3NEFkTmtZU0s3WmlwUC9ueFpiRlo4dHpYTUVyT2s3c1pL?=
 =?utf-8?B?RGNDK3BjODA5TEU2YzNLNkxPUEZpcWpJaWNkbTl2TEFsNUpjMi9DZjlwMVhm?=
 =?utf-8?B?NWZwMHJHVmtMSmZTMmhDVmNIRjFtTnZkS0didUJqQy81YTJTdGdWNWhpWkx5?=
 =?utf-8?B?eDZRb1Z4eE92cEFhYjJuSzFXOTJGSnJPNmxnSnMwdUNtZ3pBTXZ2VDhVR25z?=
 =?utf-8?B?bFJQd2p2M1JoMCtEa1o2UDVERDJOTUFHcHZRb3h1UVZ0UHlNOFBOZ2IyL1k4?=
 =?utf-8?B?TVY0d0ZDMmdEazVNaFJDZEV4aFY0MkcxaUpPSjFLcTlvQjhaZk01VklOSUg5?=
 =?utf-8?B?Q1BvM1ZaYTRqeEh0cHZIZUgwLzJaZVB5SWoxS0N3MldEbkNXR1MvYUNZa25F?=
 =?utf-8?B?RzBUc1o5K1k0M2dqTjFuMllReFNsUjFoVWpIV1l2WWUyd1RJNzhSZzJ4SjBs?=
 =?utf-8?B?dGRmOGZnc1ZrdkQzbU4wTXQyYlREOXpnQ2tlYnN0VmN0bE9TNW1PMzFud3Z4?=
 =?utf-8?Q?N5j8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3BlVHN3ZDZUcmJRWjNVUWRqSjFuVHMwNVViOTdYSUhRcEoyYndoLzdPRyto?=
 =?utf-8?B?TXFQL0dFWExyaVp6RUx3MEhQNGMzc0c4OWg4S204aVB6ZGprc3ZQdFN5ejRz?=
 =?utf-8?B?OXpvdVZOa3dGdmQwZGEzZDFzek9ZKzRtb1Q4WXV4cE9FNlNRNlVxSDFWOTVo?=
 =?utf-8?B?Q282RUdtcWJ1ZzRCTC9aZ1diemo0czVYSlZibHo4WjRBbVRsc2NqSGFHekVS?=
 =?utf-8?B?RlpCRTBYWEd3c2V2dHMvU1JUbC9iNlVoTXk3YlkvWm9YMG5JNnY0VmgrTkp5?=
 =?utf-8?B?bU95MmNRaFl1T3pKamx2MDkrMXl5YXNvMXpzMXF4bXhIUnpabHBseFp3Tzhj?=
 =?utf-8?B?ZXhySmMycG9NYUczdElvNnlFdjZOU0lLLzhoQjVUaWhBNXYrQ2hIY1R1UnZT?=
 =?utf-8?B?Wnh5UGJKWVd0TlJMNTM2MXNSR3ZsQkl4UFFSS2E1eE94RkZiWEUyYUk2QWRp?=
 =?utf-8?B?bU1BeWlQU2llZXQ5eHp4TmVGSGdvREdnYi9LTEN6L3QvQUZ6dkk3SFJHNGJV?=
 =?utf-8?B?eGJ0V3hiejBhcGVlNFBwZldJYkZ6QTQyRHg3TkJKOWs3ckkvUDlxOWdPK3kx?=
 =?utf-8?B?MzU4cTJNVGVjeno2R1gyaG0wb0Rud2RpbzBUS3kxSzVXVURBUDVaZStiZGJJ?=
 =?utf-8?B?akw3dmIwY20yQ0RxNTNUTjJma2VTVkJiYXF0NEkwamFtN1hDS1owbWJpU3Vw?=
 =?utf-8?B?VSt1eVc3bEx5UVYySlZ0dEprcElrR3MyQ3FydW9HNjNNQlRKMzdPb2RPSHVZ?=
 =?utf-8?B?SGk3QXhLS0dPNXhhbnZjcEpiY3J0NWZFNXhhM2piVU5Gek5YWUdCVTVXa3R6?=
 =?utf-8?B?cVduOWtDMHpuRmt1TkRXbzM2SEVhSFFOM2g0YTBQVkQzamErajRsaG1MOURT?=
 =?utf-8?B?TGpLbm1qUDhSTU82Q2hXWWN2YWFHcHZlQW82OTJad2Jtc1F4L0orK0pjbjZs?=
 =?utf-8?B?Qi9vcThYVXh2Znc3VGM3RGNwRGxSdnM3NFl6R1VNMC9IUlRGYlF5c2FBM2or?=
 =?utf-8?B?Nm9XRnozcERkaVZJQWZVVEp4bFZCVVBDb3VTeHlLaWR6Y0pYeEhoaUZGR3Vr?=
 =?utf-8?B?emR2WEhJL0hqQy9FQUQvTGtGelpJNGlQOTJMUUY2TmM1SFl5UHRDZ3dsV1JZ?=
 =?utf-8?B?QW5wUHlLWERrU2duN0U1ajVRc2JKdUwwZC9LOThuUXdOOEdsM0hUR0VjblNk?=
 =?utf-8?B?T1FwK0llNjNpT0p6TS9rTlE3UDczclZ2OGxGSFJYTURsVDBLRm1RRG56Q2Vj?=
 =?utf-8?B?OE9peS9xaDhpQ0tBVHpBK2Q0SGFFV0pXVzN2UUc5TithdDZXcHh4OHp1MmVh?=
 =?utf-8?B?VW9NZitzNVVLODZDRHE0WVpvN3BoRVYrb3ZqY2dkV3E3OFZlOVNSWXc5byto?=
 =?utf-8?B?ZUFuTWdjMXFGMzN6NkkyeWgzUVpCckpXdUMvbll5NkI0QTY5a1p6S0NoUE5J?=
 =?utf-8?B?QmVlOXNUYTczNmhncDFocisrU1RIcFFhTWNhVGpHY1AydHZPMlRmcUt0V2tn?=
 =?utf-8?B?RzkvL29NRjVoZzN4eU9EM2NaSDBZWUZObzdXRTEzNy85WjdLTm4xMFhSSk52?=
 =?utf-8?B?OWw4clUrb1hUN3FoM0RuZWVSOG1pcXFXNDhSYzBUdTBqdXZLa2xLaWwrZndm?=
 =?utf-8?B?UE1oUnRJcDlhTGNiRDFmc2pxZW5BSFVLbVB2QXAvKzFTUmNld0trSkxGZ25I?=
 =?utf-8?B?U3VCd0h2VHBMcjE4MFNDeG9hV1NTb2h2Sk43WlpaSVpVajY0MXZ4elBQVHAr?=
 =?utf-8?B?UXJnRU1vVS9SZmM1RHV6cG1FR0Q5NEIrWk5veEhHeERDVFBoc1ozajhmTk1w?=
 =?utf-8?B?Mk9xQ0luZTNJNk1EcU1qS2IzZG1PT2h0OVlEckg2aUYwNVovYVFiaVJLZFNT?=
 =?utf-8?B?QmF6MjRPRDEvWnY5dldMNjhLdzVjWnRtU1B1N2VneUJtcXdvWnY4blZPTE1O?=
 =?utf-8?B?V01EMy9DVGlUUTk0SGZ0d3BsRyswT0xEcFVSRUs0YzA2SUdEN21naW1VMnhY?=
 =?utf-8?B?N2tIeUx5UVJWMzRpeDRESys1MTVrUElOYVgyL1VacUlCTHFEcjdxZjlGQmlp?=
 =?utf-8?B?c09aeWw0Y1E4WGxBd3Fad0NBVHp3ZUdsRVN5Rkl2bTA4bG9jNERITTcwZ1d0?=
 =?utf-8?B?SmtmSmRINHFXenFHYjcvajNDcXZadlFwVDdVV0FZaUUxeDdCZzRRK01lckFR?=
 =?utf-8?B?Y3R3WWFuYWtPYS94OUFONzNsSEIzdFBzOU9zSmUvMW9aUk5sUHZXVWRuK3Vp?=
 =?utf-8?B?bTE4VmIrUDM2bXR6NkViMEJXUjhwUGRxdys5SkpxaEV1ZDNPbmxpRjVZYjJs?=
 =?utf-8?B?RzMxSDREa0ZuZlMxRHRBSW10aGl5K2hNb1NtN3lWY01leHdkUTZieEY1VFly?=
 =?utf-8?Q?HunTUs36hmUzo6wE5my1zqBF7DuH9W518opPPq3rzpqmk?=
X-MS-Exchange-AntiSpam-MessageData-1: VMNOx78vrY33rg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bdc9ac-6f81-42a3-5a9c-08de728cb34f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:36:16.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2JkNU3pjHd6vPiUXlbC69rN1woioIFRi/ErCbyAFGDS3rrBPazBS4cloYE16IU7vtnVfplfQWbAHLqN+8buSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428

On Mon Feb 23, 2026 at 4:08 AM JST, Miguel Ojeda wrote:
> On Sun, Feb 22, 2026 at 8:03=E2=80=AFPM John Hubbard <jhubbard@nvidia.com=
> wrote:
>>
>> Works for me. I was anticipating that people wanted it in rust/ but
>> I'm perfectly happy to keep it local to nova-core.
>
> Sorry, I didn't mean you necessarily need to move it -- I only meant
> to point out that if you do, then you don't need the other changes.

FWIW I think it makes more sense to keep it in `kernel` - even though
Nova is the only user for now, this is a useful addition in general.
