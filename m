Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954D722F16E;
	Fri, 23 Jan 2026 23:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212118; cv=fail; b=Xp9EEHTX9zYUc5HETGXK5ErpvFMi3+Qv9e/hfhJHWgtZUXdAa8Yk8MuQxF14dgxGO7ahRAEFXR3ZtRBJSYIk4gyFEICLUEksazAzyTqle/THmNvIG3cmoXTLynk4am1ae4pY8lJuJDA9vREzdMit7JeKXYujmGyfZjtZ+c70uFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212118; c=relaxed/simple;
	bh=laWFK1PN080xOkXQKo6Ndb1U4FgMUltyzzYC0uNm89M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uCo7abf8eBTtib3R8V4HpV6z42UdoqRUxwWurgN+sJjPqK7f4bEw4kMWy5ZzpDfEddcMBsKEr5w1W0mbtbK0eaE+jBtb4Qg3DlX3kB3rggl5fIELn+//jPT6bDzCK8My4W2uNV+euDE4CPQ3ffosSDTcuT07Q5F/PIBq3Wb/Z1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CpAxaW0z; arc=fail smtp.client-ip=52.101.56.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CpAxaW0z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRRczAWlOp3Fe5WJEGJDiUdyDHycJrF4aYNghyrINMw7Ovx+kJ5GMu3RXpUEWk1EjFKlOrnAoVFszqXqmZCLCNGxCKoSqyzCMnwPf67HBq/QZc1i1TNvYx3jmtbDajTPaTyZ6NaLVUTrGoF0nzSpIXZfcsIkAM5Loou7F8NpO7HOo1fCEDrfrs/+qqTfayGZPR6sQ8N1P9QkhEwfWV/mNDVdCBk9o30YZc6MPdx6S49ReCP4FEhFdeH745vvqvw63/TNMXrNSxw+9PHuMW0gP449cbg8wjr0JbSYmMVcVVeuBSjCbilbXqQPxHknHumeB3OnbtgUo+jLJwwwpB2iFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvhKh6rTpAn0J17r1MOuwmjAxBt/ZORJ2Cl8uW7Gk2U=;
 b=Ip6wxDxTa8NYcRWekzcEQmAaA4LVCS31l4m36VCijcmzQLOo3zqwhT7228A49p/DBDXkrEZgwKyn8YbTWaR9rGcYRnSqNoTzfssBqKFJJY0sOt9o4lruTKzk9NQpkEv4XUN5ID9raph9LQ00Wh95zcNQE/SsNcNFHa3ttIUqXvl75PSBLO3w8sfIA+rnA82Ac9WDF9FSiLYH7luXIFzHmXpTUKOix24BT4ItPav3am7XojldfzTCTP9hpbYcAOkiay21mAEJZZe3znUobCx8f5SMzLY0gzHxYpU/Z3fcOz+RrERNw64Y03qurmP21S430z4b26mt2bOyq9fRB+lNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvhKh6rTpAn0J17r1MOuwmjAxBt/ZORJ2Cl8uW7Gk2U=;
 b=CpAxaW0zKwd0uwj8FnflgdodxNh36IfNzVseCQA+C26PDCeqN+JCcEdYnlfCZXbJQ/50prdSwXLvccphAdH+k/w8TaJRQroT9L6AK/R20zA5PdVHpxKLgnasB1oasCOBMvQghtnxi1QfR9tBwpdGbcWifh0wgSHsdZCKeVVgwSSflD4MCoF/RvOIp8yQKNVroSbdlTnnUZOAFNGeZOjRX4a53m+bHJwvKdd2icOe+ahndBr2ebABA4WpQUTUgqxBwqwf6PMm6cEwlV0Fz/+tjtAFOk9xJaIHcbrwj4sTpzOwz7qnr5z58S/M2pzccxnQ7AZoa3iNylvCvC12i7dlVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 23:48:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 23:48:32 +0000
Message-ID: <665f3d43-7f0b-4efc-9092-2a1f7234ddaf@nvidia.com>
Date: Fri, 23 Jan 2026 15:48:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-16-jhubbard@nvidia.com>
 <DFUE9X1HQG9S.2YDWQ6GDLN36G@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFUE9X1HQG9S.2YDWQ6GDLN36G@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a47af30-4f69-460e-86c1-08de5ad9ea82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWlBTXhSZHNIak95K2RQVVY1VENtd050cG1YYUQyT1ZXOXdZMW1BZit4djZZ?=
 =?utf-8?B?UUFLc2NKazJrYllsam5oTU1TcFZKWTM2SU15cWxrTEtJV2E5bXRmMlozTk1t?=
 =?utf-8?B?QWNZbnVPMmhvZ0M4M1JQemptZUZJZzNIUlJYK1hweGgxc3dEWGNtVCtWSHN1?=
 =?utf-8?B?clRRcEZid2haYWV1dWRLMUdrL1pMTGw3cVJtVUM5M1drMU1rM1lJMzVyOGVG?=
 =?utf-8?B?d1VkNVF3VWZmUDdSV2x3OWNVS3VnNzY2UTRVblEwRFNtcXRuTU5YeWRaN2Zh?=
 =?utf-8?B?YThGZDJ5Y09nMXRLM1g0aW5oOWdDR0ZpaTgvUkYyOHl1dXQyMk9DTVFaOE1E?=
 =?utf-8?B?ZkVhVU5PQ0dLMlRqOXc0V1d6MG40N3ZQTW8vMC9CR01qVnI1TGR6NnBsZXVW?=
 =?utf-8?B?dGt1UVFYdjBkZDFkR3RQUlhoM0JuMlJYVDA5QkJtRXRKWHNMeDdNLzd4T0Zw?=
 =?utf-8?B?MFVXendweTFNeDBOUHpWbHVndnFBU3hVU052L1ExOEVqbTZ2Tm9KM0hKVFpx?=
 =?utf-8?B?OUJiR3R2TkpObmdsVy93cGZ2ZDNiakdTWlhLWGR2aW52bnNuVVpIcDVjRUxI?=
 =?utf-8?B?UEtKZmFEc2xVWVFVakF6RW5OSG4vNUg4Z0ZaL1dFQXJTVSs1TXlUZG94OGZn?=
 =?utf-8?B?bmNudmszdEdUaWNrUFZqcHRWeFVQUUtnb2diUU84dmNleWlrY2t1LzE0Nnhr?=
 =?utf-8?B?REpWVEo4WU1VY2xxYXl3bitKK2JyOUhhSS8xRmdXS0t0U0U1Zmg1ZVVVeDVK?=
 =?utf-8?B?MExCaUJVZndGVVFSbXFFZGE2dUNXK1dMUWE5elducHNNbnlGbk85cWVpMXcr?=
 =?utf-8?B?NXNuTkF1RHRHTWMxdVgrZUpmWFNneUVOazladFRuV1FmeS9ZbUpRdkFKaCsr?=
 =?utf-8?B?bkpqS3dIVTBTWEpnRm9PSDdXUGhTVWNrc2U1SWhKR1Q5aFI3RE5lcWM1V1VY?=
 =?utf-8?B?WUlsMmpzZnNCZ3E1UkRvWGsyOTk4WTJnOW5pMTMyN3M2SEFOZVRDWm5yWU13?=
 =?utf-8?B?NlphWHFSaGhHWUZqUFlNVkJoOWFMZWhRT1prSW9UVklzVjZtdmxrUGhERlAw?=
 =?utf-8?B?TFBxNDhrSFB4eE1BUEJ2Wk9aNEt6SWltcUVIWkZTbThLTStVTGhrMzBRQTkx?=
 =?utf-8?B?ZEMyVzBKUHVsK0ZoL3VpZWZtamlySDBHekpVSlJZbk13NjQyZU5vNlFEK1hK?=
 =?utf-8?B?ajhRTnNkM1RnajRSUUltS0NBeVB6cFV4b1hFbGJCOE9SbXRLNnVJcllxK1Av?=
 =?utf-8?B?OXk0dk0yRDh0aVN5WmhEWGRnTkF0dis1Qmd1ZDVuMGV2SGpkUEVMbGdlN2dK?=
 =?utf-8?B?VXFFOUc0M1oyQ2RpeFphZUNUVm9sRXJGeWptdSs3cmhMRDhleUZPbXYybzVS?=
 =?utf-8?B?SWVlUVFyTE54THkxZ3Q1cU05Zkd2dzRZc2p0TWpWeEdRM0Z0Q1c4ZTVGeWJp?=
 =?utf-8?B?NUVlZmZDMFozeFNXZUlGWXJmQU1HZ0NDekJLVC8zQ29hd1JlYmJobEZoRlJu?=
 =?utf-8?B?cGRqbmcyYk1rVms0aWNnQldmMzBjbldRcCtYOCttZ0dGVzhsSy9SWGVRb2pp?=
 =?utf-8?B?YUpYQm9iL0IzTzBVN2VmNWVXYUNpMm9XSTdhODF2dE1qY1B0bE1VcmZpbGNH?=
 =?utf-8?B?Y3RvRmNYK3ZieEpITERmajZ1VmhJZ0gxMjZQTFJiTW5TM2lrTWR0WEpTMXIx?=
 =?utf-8?B?dUVPUTZBd3dQOVhaZ3lscStISC9XWTNrdldEeWVpcmNXVVJJRVVvYkV3TDdY?=
 =?utf-8?B?MkVTVHBKNkVuMHl1WFRMMGh2cTUyZFl5THB6Y3JXb3QvWEYzM0hkRHNjOFlx?=
 =?utf-8?B?U3VGZWdkQlMwbFpCQVNmQWwyT2NiTEZuYTJ6NWkxS3QwSWZtZi9wNlJ3cXc2?=
 =?utf-8?B?WW9MS0FldjJwWjVQMW1GTlhhdU41RlNqcUtMUTlKdDNqR1BTRUFlcW10NHJG?=
 =?utf-8?B?dGhqb0g5UFJqS0tnTGtYQ2JFSEVwTUsrZTdNdEZIUWUxUkhiK3JraTdkWmdq?=
 =?utf-8?B?NGY3NGdpOTJHSlphOVlPVlYxV00waUJIdUE0dk9lRmZYY2VVb21kSHJoQ3Ja?=
 =?utf-8?B?a0xySG54akMvUmVVZnRWNVU5V0JxOENvMDJ3YWVhbVhWbXJBZy94bVVITEt0?=
 =?utf-8?Q?L+1k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1EreE1JSzlKbXlhaFl6dmlxZ0hVVHRycTRXNUdCZE1sc2tncWp5YS9CYnlM?=
 =?utf-8?B?Mm1vZmhTNTljL3JoRG80YWZUTWRJakRkdExmMFVGNm94bllmNkJBNEdtaHJ0?=
 =?utf-8?B?RTlZME1wYThkeXZtNGxSR0t0OWhiWGhCWjdMeGNiMWdUSk5IdWZkaklIS1BK?=
 =?utf-8?B?RTN4WHdqczUzbzNROTBxaFd5alpLd2s4NU41dGVEMWpHY1hnckJkdmZPeUk4?=
 =?utf-8?B?L29nV2hHNWp5ZnBQVnVQVVluSU55RVNjRE1EUlpMQU05R0N2SDlGaGdERDBk?=
 =?utf-8?B?WDRGVWVDK0Fyd096Vjg5NitXc1BWallTTUpGSE1GR3Zla2Naa2Fpb0QwTjV6?=
 =?utf-8?B?a3FmKzd1a2dEUjMrNng3ZTIvNE1nRXRLbkZxK3RpU2VWN0ZFZVlxMUxqTklp?=
 =?utf-8?B?MUM2QWlCMjl0Q3U4TTJvV3NiK2F3aEl4R24yTVdVUjFKcUNqajNqQk1UeUFE?=
 =?utf-8?B?czhpT3JkRXNCQ1VaYmZqTThNbDcwNW9CSjRKWkhDK1FvQ0FWajhhNHNveEVB?=
 =?utf-8?B?KzR2ZXpTTWh4bHpiSlhQaUk3NTBMM2RwVFdPYlVtWUJBSGs3WVhIcnJOaHRP?=
 =?utf-8?B?VjV4TzFNcTJTclBTeHhTNk40Wm5WaTRXZFZtM0hyTW1YKzRPb0d1VHE2TkVt?=
 =?utf-8?B?NUFXTjRLL05VMjhYNDNTRytjM0VjVmJ2cC9ocm11M1NjMXU1R1RWZDRJR1BS?=
 =?utf-8?B?QkV5aS9qWWZISVExTjJqbXNpa1NyQzd2R0U3ckllY2NSTEZxM1pHZWFBZjJO?=
 =?utf-8?B?ZWxIYW81OXFEenFDb3RzTlk4cjVpeGNuM2JXcEJ1ZURsMGpvSGQxeldlRUlQ?=
 =?utf-8?B?YXdPTDB4LytiQnNQR1IrbXUyRnZobDBmVE5RSnFGeUtMekE0M25sSlJYRzZn?=
 =?utf-8?B?ZVQyT2REYXN0bEVJc3lvWmcwSnRXTEg4dVhPUllUVG9qVGR1NkhDMmhZR0NF?=
 =?utf-8?B?S2ZRdmNSOER3cDQ3RzJnYytBcWM0Q21RQ1Q1QlROcWR2RzZ2K3VpTk9UNG0x?=
 =?utf-8?B?dDFDMjZSd0cxZ3ROTHVKWjBVdkVBMC9FcnJ4ckxoUkZxMVozK3c1ZzM5UnVY?=
 =?utf-8?B?L0J3czhOTjhJTitOUXFSbFdZa25wN2JRN3pJNy93ako1Y0gva1BtcDV2VHJY?=
 =?utf-8?B?cGRpWVhnZTdlNU1Hb005YU1zdHNBQVZnVk5manBMS2tGUGxtUk8yakZBQUds?=
 =?utf-8?B?MGFNRHh6ZU1HNjVQZnlWT0pMbDVXejhCdm9WUHVxdGxQdTVtbDZFYnNnSVFj?=
 =?utf-8?B?Rk5PSS80SCsxRjVhT0NtOEdyek52N1M0Q2NnWitnNnFRM01XVy82V3J0amox?=
 =?utf-8?B?RHNDZDNqZEg4MU9WYlBySzFQYnd6VUZsWG9jZ0Qzc3RERmNjSS9OQmhZQ3A0?=
 =?utf-8?B?OWtUUVB2QUVCSkQ4U2FaSk9ldDlwZGJjeFdhOFVoNUVsdnFFbjkvOHloeHUv?=
 =?utf-8?B?cVZKTktwcFFsdE12TnJ1aGVtakdrUHZrV09kaENnbVV1NFZiaVM4ME5WZGgr?=
 =?utf-8?B?cmhWWmQ2cFFPbTdtOTE4b3pVQ2twbVc2dThBQTlodkZ2c2toV3BUY2wyTmFW?=
 =?utf-8?B?S0Z5OHl6NVFxZmxLOUFPRDQvZ3pDWE1IM3BOWWFEYlZtTURKQnRqY053M0pD?=
 =?utf-8?B?NEdpOW5xWE43S0ZEQlRJZ0xuV3ZOdnFDSE5DK1RsMWVVQ0RTSGV6a3M0TXNR?=
 =?utf-8?B?QjYwbjZBRFFyY2JYWUlDVFlLWkxVeWFzQUJLOUpyN2h6UXQxNGNVSUNqYlNW?=
 =?utf-8?B?Nng0MlIrd3FpcVlGRHFUZkpJbFFOaDFYTDY4K0EyYUVDRExRVjJNNlViYmZU?=
 =?utf-8?B?M3QzRDR0YkVtSVY2bGREbFUwT0RodFRieEJtYUlXTjBqWm4vKzVSN0h0STh0?=
 =?utf-8?B?UCsyMXlzbERYcWlNcVgwTkhHa3Z1aWYxUkp6c0g1QXNPYU02bWdHUWZydyt3?=
 =?utf-8?B?Z2NBL2dFUUR3QnVSdklFNEE2RE5SQTZld2dhOWtjcjhXUmRqWlM3eVhSRkxS?=
 =?utf-8?B?ejl1WlB1UXA2Wll5QUw3RDhoYjNPNGloNWlGS296Tlp2UUJSZjduazI1Qmto?=
 =?utf-8?B?WlpzOHR3ZWZlV1BHNWhLVUxHbm51UGo1YmdGK0ZhS3F2eVlqTWlMK1dVbEpN?=
 =?utf-8?B?STI5anJjKzhDL1VQUmpaTk5rSlBtM1I1d0tMKzNCSkxXMnVuVE56V200NVRj?=
 =?utf-8?B?aWlOaVVvZXQwYUFFei9ZRXl2RkxER0ptRkI0Q0Yxa29NYzdrWXB2UzRSMlhq?=
 =?utf-8?B?Wm91ZnAybndTUGxTM0ZrOWdHclgvU3FSamQydTlPbnFYdEJyV3J5QmhLS2lE?=
 =?utf-8?B?aUFzMFNmamsybVl0MGFIVEVBYTRMVmJkM3prQm9UVmFqZHo5NktZdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a47af30-4f69-460e-86c1-08de5ad9ea82
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 23:48:32.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1NsHoP66hqWjqixHrhtYOz8C7OZ8yV9p4mSp0KLfqMwOxjxVd2aKAU1S7BO7kafGvbLoGIwWIm60rHrADIp1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066

On 1/21/26 8:06 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
>> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
>> engine. These operations use Falcon PIO (Programmed I/O) to communicate
>> with the FSP through indirect memory access.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon/fsp.rs | 60 ++++++++++++++++++++++++++++-
>>  drivers/gpu/nova-core/regs.rs       | 10 +++++
>>  2 files changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
>> index 7323ae2f2302..9e796e82e556 100644
>> --- a/drivers/gpu/nova-core/falcon/fsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
>> @@ -5,15 +5,27 @@
>>  //! The FSP falcon handles secure boot and Chain of Trust operations
>>  //! on Hopper and Blackwell architectures, replacing SEC2's role.
>>  
>> +use kernel::prelude::*;
>> +
>>  use crate::{
>> +    driver::Bar0,
>>      falcon::{
>> +        Falcon,
>>          FalconEngine,
>>          PFalcon2Base,
>>          PFalconBase, //
>>      },
>> -    regs::macros::RegisterBase,
>> +    regs::{
>> +        self,
>> +        macros::RegisterBase, //
>> +    },
>>  };
>>  
>> +/// EMEM control register bit 24: write mode.
>> +const EMEM_CTL_WRITE: u32 = 1 << 24;
>> +/// EMEM control register bit 25: read mode.
>> +const EMEM_CTL_READ: u32 = 1 << 25;
>> +
>>  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
>>  #[allow(dead_code)]
>>  pub(crate) struct Fsp(());
>> @@ -30,3 +42,49 @@ impl RegisterBase<PFalcon2Base> for Fsp {
>>  impl FalconEngine for Fsp {
>>      const ID: Self = Fsp(());
>>  }
>> +
>> +impl Falcon<Fsp> {
>> +    /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
>> +    ///
>> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
>> +    #[allow(dead_code)]
>> +    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
>> +        if offset % 4 != 0 || data.len() % 4 != 0 {
> 
> I was about to suggest `is_multiple_of`, but then realize that it's only
> available in Rust 1.82+...

OK, I've added TODO's for that.

> 
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
>> +            .set_value(EMEM_CTL_WRITE | offset)
>> +            .write(bar, &Fsp::ID);
>> +
>> +        for chunk in data.chunks_exact(4) {
>> +            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
> 
> Use `as_chunks()` can save you from doing this.
> 
> Also, a typical pattern is `chunk.try_into().unwrap()` -- yes it has an unwrap
> as `[T]` -> `[T; N]` can fail in general, but not with `chunks_exact`.
> 

Here, I recall having a discussion or two about it, and we concluded
that we'd rather avoid having to justify an "infallible .unwrap()",
in favor of just writing out the four chunks. I still like that in this
particular case, it's just one less "// PANIC: " to *not* have to deal
with. In other words, one line of code, instead of a line plus one or
two lines of special comments that someone will later try to turn into
a proof. haha :)


thanks,
-- 
John Hubbard

