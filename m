Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021134.outbound.protection.outlook.com [52.101.100.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725393F23AC;
	Fri, 27 Feb 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195627; cv=fail; b=IGPsXnXZ3CP8ZxPkRWKJWCU3iC7GpsMR2VbQpSPJ/MueHG6kHawL1kE8N6ENCWGUuDsgySpcy0H/1FgFglVF+gZ1/9lUgZBtemF67onZaoIRA7BS8nTH9CYPK+EQ3QAhz8hR/KJhZj7vUxlejWTZMXhqmarnA7mkmqBICM83KU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195627; c=relaxed/simple;
	bh=eXY4D401IKX6/sfdQ1ijO/78TcstN16rYd6H9iopYVI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=s3LXfcoemMMaC5m89OYN3qtg45lI4Megwo5bVJmiJJ4o+7PcBmhRr6T9YPBV13P/GDQ3em79zQxJ8tozLFPhsdqseau/yQ8a25kOLoltD1atk/Pd3V3Rus3t07QsJeM9GL4dCh2WrY1YLMNwekc77PV9vVEJkwcp5utoggsO4hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Qrlwe8Mx; arc=fail smtp.client-ip=52.101.100.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Qrlwe8Mx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk9gm14noBs4peHLHQlKq50Qrz4xJHO4sS8bPEoeqDDPjVdESGvBJOmZZVHy3PGPzrOSy9ogRXYLLuHOHp0axEJ9cryQdqaU9E+XupbGUJ73fsF4NgeC1EaRaTsIlibV9u0Viz1ztHNszbCiZHVaeNTWJjJ7+UHMCANBAY5G9iYXLyjP+aEc5fRJ74ugrfwAjiQX0ai0rVFGl8uUYHC6ojPPUeAuSLcrHbVccotnB60KJ6GEc7Lc/kj8zupTNcqPkxayKgMO8J8YOgKqPgo43Vjep0yD8+tFfZihq9doKLAtV2DB2qAQuIrwzj65mIPJ+WkTZnQD9mVPg21ECuZQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmJfiL7IS9quKgzetPD5FdWpWujvAwTDzB0AHOuPAWM=;
 b=xto1++B/q9KKDZ03qIGdMR8hQpb5r23dNrePZk7s7+8XjgY1R9Y95te5KRIvHvh9AVj47rzKhzbqY1EQQG4dLMmX7lARSnkTWc4xb/+sS3eF1ddt8NZ1WHNyt1CYA92FV6SauvmifTZGWEL1d2VNYEJZIcsqZmBlsDEVYkVr3TsjHkq/jelaUbd9RSOm8EYLKC5pt7FjVxzb643uBbl4yNWRbedCoCT78ETLg5YId/QxGVnt+LJ5foVfaZBo8oJaaEZx0J+lRWkPwwnAm9JwNyTNyL3/9Tal85GsTJ8mZO7uxzPtvoB5JUoxu3hjMt2BfOutyJBpkeEhuhwfwOjOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmJfiL7IS9quKgzetPD5FdWpWujvAwTDzB0AHOuPAWM=;
 b=Qrlwe8Mxgz1619iRxfxh/1ED523Nz+87OAUQLd6Sp74ivWtmh2XD5DhW7EyPoEjcEI1xQjHgu8y1XT/vEsT7dCPSW+23taAU1p+vit2Zk7O+uOR3P4rLZEZwC68THfCUSclkDF1RBvJ/79/ilLFSfnKL1VXaT/X7wPUaW8eci3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7896.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:205::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:33:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:33:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 12:33:42 +0000
Message-Id: <DGPQX1Q10WMX.7NLEJRKKG5XK@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 04/10] rust: num: make Bounded::get const
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-4-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-4-aad44f760f33@nvidia.com>
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0523b8-e05a-4a44-1079-08de75fc718d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	dODW8IiKKU5DJgVq61aElYqT/HTONCeS37RKVNVyOn2xLK0QYF0iYw1AdvEp8sbXYsmd+KwDi1hMff+155dG+O4uVr9rzXQva/mp5W7Mu9opBddSl6ONiav7K389xOzHfOz/gy87TMoNjaHjtyO7bmTuKA0iWW5Mu4OHyOfyyOGkjj7dP0y8FYulpUl8r756wJTf6SSFy55I/Wg+ePWh/XNOMaABPBVIZpv4KojNsA+r57jurmXEzBhpmHzPZid9w518O+9YedSlWYvgYZ0TEvFFCYqC//Jt7dqKgQO+yLu+nJUTsGIq7IBwi5a1A8mauL7mZitHLgytEeOvGAI8bXsxFAtlDwN77FLZ1rw/rhixxFYlOFPyOMN4+4bTVQ8o1AHvzEKYo/Ki+qLFvdUQYhOkLuMs2w8EEEGhNxnvl8SdhKA6yhxNBWJrW0HWOXhCBw1Ii8H8QcvxXKZH/rvjeWoDD/29AaK1EDK6WkxQVI7sfN0y7+khU3KPx/gDx3yd1p3XobBm2mR0GKZlrdqd28cqFNjPLGTelFvxMhQFtEGg8pOVijOj6D1zVuH4tP/GAvinHw6Xqe6DnlroR1OX9d2NriJj+yZFAYu6jvoCVijNs3lIamH3PoD+L5rskAkLx1Iu7E7hELP0BVnPUEW5ClrTBPh2N3nXHwO4c6fO9hh627LEc68pqAZPdWLDPmXjnW8Q4vk6iBE4KTgWdzLIa8sQ72Frf5fSzCmSfJ9mGsnblWwilFvKjIjUb/vIzoTqks46N8HxaAgOT0cw4MowRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3JhUk1DSFdYSHFWSlFHYWdoTzd5VkJRRTB0Si9MM2VFMmVpZ25uSFpGRmdS?=
 =?utf-8?B?TzZndi9ZSzZHWFBwMUlZOXIwMFFNZ3VJeUxoU0xhQVk2RU1GOEwyb2lzcXJF?=
 =?utf-8?B?cytaZjh2dFdxNlA5b2gydDNtK2gvWlBmZThYdVluYUxJTHh4ejl3aytCTUlN?=
 =?utf-8?B?T21ER0ZrT0xPcm5QK0JqQ2cwbEloU0htL1FxSEpyR1VWNXZrYjU2R1ZFRndG?=
 =?utf-8?B?QXhzdFVsTTExTVVXSms4YkdEcW1wSHVqbTRVUTgya1VlNGxOSVlFWG5tU2Jr?=
 =?utf-8?B?eURYSjdlK01XVElrVkNkWGRsSHl0NUUweldZcEZUK2xDeEliRS9oKzBNVUlN?=
 =?utf-8?B?Q0lCbDdVUkF6dHd2L0ZldjVjZVhnYWxTWVlyOWhhMmpuVEZXU2s1MzdRUU40?=
 =?utf-8?B?cm5EU2JsSWg2WWRpOUExbWFSdmlQOFhXa2dSRFZrek1reU1Md25DblpEQUh0?=
 =?utf-8?B?cFZHMlFYdDZyQzZaWjV3Ni9ZdkxvZWV5SVVVUG5neFFPTEdjS0FxYTYzYk5T?=
 =?utf-8?B?QmZWQW54OUU0U05QWjhPbzR6ajhFZFdyc3hEKzg0Z3B0YlBEeDdhczhQblFp?=
 =?utf-8?B?QTdtOFlLbE53STRKWGxSVkcvWmh1SG1pSzRJa3N3MGNOUVVIQVBKcDNXVWZG?=
 =?utf-8?B?RXRmd1lpMUVhQ2FxeVkxMS9pZmZjYnJpRnQzL3JKZTRQbi9ZT2lZd0hvQkxW?=
 =?utf-8?B?eDNyZ3hHa1BvdHhTeHlxRVpLUjRVa3lkbkZwdWlRV1ZCbURnbHZuVk9zNUpE?=
 =?utf-8?B?VTJjQnJNMi95eG50NzBXUDl2MjdWN1pJRlFwUE1FNmdVNXJQK211clFhWGtW?=
 =?utf-8?B?QXE3Z2RKNEFmVnhSRkxoTGQ5VXlUbmUrRU5wa3ZTWndMcFVDTTZWMFRBUVJn?=
 =?utf-8?B?Wi9maWNlTXpoaTVMZ1FMZkJETkJXNWFQdXZPUEovWm84MVA0YkxlWWx2eVEr?=
 =?utf-8?B?V3VqNnozb2ZOWFFHNTR4Z1FQSmo0Vzd2V0tOL2ZmSTVWSmhRdXZFdGFQclhB?=
 =?utf-8?B?Yit4VGw1NWVaelFJbXRxUXRnNytBNWZQb0xtQjhGMUdtWkhMTnhPRUwrQ3h4?=
 =?utf-8?B?aS94dVhMTGNBWEkxcjNjNzZzcHlDZ2hialF6U1A4WjdFYnV6SXlmWkk2bjJ1?=
 =?utf-8?B?aDVwajAreUNLVkJFNFVZT3NSeXJ4SlVMWjVuaGplRU1OdDFjNzJiZlRCR0RP?=
 =?utf-8?B?a1YxNGdMTEZ4N0FkMFdJYll6bjJabzF6ZjlvV1FQd2h2TFBhbW1vTFpVZzFo?=
 =?utf-8?B?V1o4UXhna3A4b1FndzY5YW5NMlk0ZUVFVnlDeGJQRFg3d1NLeXZWd0llNFFi?=
 =?utf-8?B?ZjlhQlE0UVRMTWxETndoV3VqYStFcTh3eitva3R6dmczd1ZFdi9KQS9KM0p0?=
 =?utf-8?B?UWZCQVYzcWM3THRRWEFlSm5yK0I1S2I1WWhXRWhYMlhha0xERC9yYzg1VWlR?=
 =?utf-8?B?YWNwTG82aHI4dHAzblQ3TWZXbVorUHVzRlJIRzg4eVJrc0swMVNvZWN3M2ZW?=
 =?utf-8?B?bWo3UjNsWjczd3JDZGl0c0xvQ0NvYUgxdlVyY2F2UDgyOGZEYkN2WVpKVXJY?=
 =?utf-8?B?cU1PQ3VOaVlQSWEyVTg5aHE0OXhScUFmdEE2Qm1pN2FtdjFyRktYMWhDM05F?=
 =?utf-8?B?ZGhPTXhHK3ZEVkNiYWU2T3AxUit3UktVTmg5RjNJNngvS1RPRGVqcTY2UlVK?=
 =?utf-8?B?ZUVHZ1dKQnZGWWpLMjJzUEg5Zkx5TzFKWmxPTHZnWUlycjJTMEdabDZlZGxV?=
 =?utf-8?B?bDNkUzZFRWxPRnRBZUFpNkltek5uN1EvOE1NWkdLT21GS2hOV3hpcG4yc2J4?=
 =?utf-8?B?Y2lGMHFPdUdNaFBNb2E0SGRPMzA1T0NmUHVOM2luSk9zVXdJdTY2WGNyVlZs?=
 =?utf-8?B?eHI4OUpaVlJTUXh1N0dLUDgrRW5DUERXYVBnNEVpU2ltaXNsbkJSdmk2L2Zq?=
 =?utf-8?B?S1hDNytGUEJDMEI3dWdUK0hWTFBTLzVYZG1aY0sraFpqTFM1MnpMcmhCMGJV?=
 =?utf-8?B?Rm5HREZOR0ZvUW82VVJhUkQ4eDVVT3EzdmlmZ3FOdExGc3kzUFhQcG1YR21R?=
 =?utf-8?B?RFpEcFdCR2w3UFltYlRlanBqeVBaZGVGclN0anl3Zm1nUTJ2OG1Ma3Y1OXR4?=
 =?utf-8?B?cFV0UTI5SW11TXcrL1pXNjZMTDludm9scDBiMVhPZDV3RDRJYzlULzBqMjdD?=
 =?utf-8?B?ZzRiMVRPUThjR00zVlNqR1d5azhHNEdISEpSMkFIOUYzcHdDODJkemNBeEd1?=
 =?utf-8?B?ajhFYWwxcGdtWWFqNUVHNjhOeEFVWHZ4c0VWRnVBeEtGQWpYNU9ZcnZlMXNI?=
 =?utf-8?B?Z3RaNzNFUmpWVmFiU0d2QitWMkx1WU1QT08vUDY1c1hqN3JQZHlldz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0523b8-e05a-4a44-1079-08de75fc718d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:33:43.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWEduR6swlX70nlNugmbTI8TUzJkEbFyeKXlzYSQi+h2+GN6uHS5jowzyUm+6FaS/8sNHZzxg0SEdQuavO0VgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7896

On Tue Feb 24, 2026 at 2:21 PM GMT, Alexandre Courbot wrote:
> There is a need to access the inner value of a `Bounded` in const
> context, notably for bitfields and registers. Remove the invariant check
> of `Bounded::get`, which allows us to make it const.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/num/bounded.rs | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

