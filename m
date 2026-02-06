Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFCA13DDAE;
	Fri,  6 Feb 2026 01:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770341089; cv=fail; b=NBBnXi+D3i6fIIuWRYA3/MJxWEffAeJMCSyo1QzULkxPkpTv4oVrmFRgPwj8Fxj/+yWk9yMu0dagvebBp11JEcWspltjwZOFsQ1OeySdqEaFcyRkPh0DsxF4hDqY59a3IdEi2ypH32oem0Cz5YjnJ0tkLzSoRr5vtOWfjgsfSN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770341089; c=relaxed/simple;
	bh=nrhmVigJduuPGd/a4CsD5O1h2YvWq+urmGAZAWqMRtM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I5VAJarQ2gcYT0PpqQdXG6c4JKpDzyLAb7FaKy/51ty5RdBFySx1HxmcnzlAvX4bKUYu+lAExTQKAiKVPEj+PBI8E5HS+Mit4GyOvJl57s9TJwj8NqxCSJs6SnCBi8qCai2WJd1ktLQ3ZgpP2JiVlFLrqinuT1OHV17QBhntHXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sFTZx6kq; arc=fail smtp.client-ip=52.101.46.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sFTZx6kq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctVvjPjANsJU6ja4eAoQWHup4PZrJcDbwcPbtCBt1sQu0zUaoh/Jl7xdNz2WYHxMDMj753RRKB8+kEh3p6uFGOHL9tVG22XVtDIgh83i0Tb/nLKRBX/9RMm5Ij2+1GMMxv0K0DoyKF8hXwEnRyS6oPyfdGLVEGe5an0oEzTGjPDqPi3QUFaHc5hf1TwhnZUarP6ovUK+5xVMlZgvJYRPUpxY7Fo9LgG0scdt+IC9IsAh6QFxEkEx06qRobRNxl9VFxSL4k62A/Kwcnh0xBsmiZ9LAZFUdbkeyCIHcIYAzT0cOx085exsUycIma4iPfLagLoW3LrngjBr7RPY+lR8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMuDTOzX8GpUoMXf/bGEXAh9DOt8WkE13StUK5wECP8=;
 b=wcsa8TbLTSL9CBAN5w1ymB9flZmaJE5Iw2AkdKgq6Es9jzPaVsIBdWDanqQOKxJpGkP8kKEBS7BiXDXqvXujau0Bse7HlzyA/X0a4gGaVzqEtQsPFfnRbKHbnc6BszxDhLs84Fjt+FWcHRn09pUi5GRXJq6jcX20GTg24TZG7VQ9ldYOuyA1CUAuSoZ44EqUXbHJdyLEW3EfaPZIiNZ1kkLQlXsiOQdOIATcOVKHK464j04X+fGfttxfySLBW12e8/8BFpOI5r5vCAjlAn5gfLpVfbaO62xw1jz8jdGY1mo71YMvDBVukQEEBOMSRvaAb72LIpmtHJg3GL64hqphyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMuDTOzX8GpUoMXf/bGEXAh9DOt8WkE13StUK5wECP8=;
 b=sFTZx6kqgsgvr3nJS3wKnsDC5Us17K7Ovvw1Wi+6G2qD+2nHZMPtbnC/xJnmKO0O7CL77Qo0El615OJ4/FT8komg1RqLrwiISph6jnnIym/heMPRqojSJrnnGL+0Q/o1zfP1OkrGwet4qRSRXMoQZDo5+pWRmNhlfqjXnVoix9toi9FI5V9Gcx2Bd0rla71NhJlaIRWBTfqoHLgvzVyRvMTX7AeNUTJWc65WoSN+8zFccHJBEugRHCC4ddF3qzJyRjkCOnJdGm+UnosO0Hnng1ipfmqtNRyxPd/4qM5Uee43gUDt4LDbKlLXt5z5aJgcABNdhKjIL1gEjUBVrEwvgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 01:24:42 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 01:24:42 +0000
Message-ID: <52c1f833-0967-4692-8275-6d448a104350@nvidia.com>
Date: Thu, 5 Feb 2026 20:24:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <aYUOME2XV_ZmRk3F@tardis.local>
 <1a332333-0706-4548-8fbe-d65956f70f99@nvidia.com>
 <44507281-87bc-4548-b542-addf3477921c@nvidia.com>
 <aYVAYq1oM78glL7w@tardis.local>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aYVAYq1oM78glL7w@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:208:23c::15) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 625309b3-b024-4103-a262-08de651e8139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2ZCcEk5RWdxK251UTlIMGgrKzZiZDltdVFUSDZ3dnZyQ3l6L0NrTDBpWGN0?=
 =?utf-8?B?eHJwMUUwckVMQkk1b0hOVThEZnN1Z25DOVFPNjZDeEdvR2phSGFDd2k3WGFj?=
 =?utf-8?B?Rkh2VXlibWdBSnNJV083SUpUMmlORmM1Q1VhbjBnT25yNXo5K3hmdmVaVVdx?=
 =?utf-8?B?Ujl2N1VYVjNTTXZNUXg3dkUySUxQcUNRWnNGREJkZWtJWHBJWWJWQWVoc3c2?=
 =?utf-8?B?YUM3Y2ZSeGZIcHhTZTl6R0hRQVk5OENnRUFXRFVHc3lyTUdmUGtuYXJaSDlG?=
 =?utf-8?B?Nm5sUUlsWVhBSUI4MWVnVnNmMmx4ZEtxbCtLMXlNeldCRG13amNTQXI2b1k4?=
 =?utf-8?B?WjJia3haQ2pCTXQwWDhEeXg5N2RkaU5qU0JEV1Q0czdlZm1DUDRSdHBxT1h6?=
 =?utf-8?B?eGZqVjB6V28wcStTMDk1NkZtOUNpWVdrUDMxclhKUVdLRFNyZ0tZSDk0MUlX?=
 =?utf-8?B?UGJrT1NvOFBKdXM5V0thaHlGRjNNS250M3ZPZW5MdkhBNTFRNG5RWnBWZG5h?=
 =?utf-8?B?ODUwaitDakdvMjF0K05KR0twNHZHTWxqZGhreUs5bHZtRG95c0FFWUJPV3Nq?=
 =?utf-8?B?aEJWSkdsaEtWOHFkU2pBSGwzUGFacjg1L1VDZFRxUk53TnFtOXI4WE8zOFNw?=
 =?utf-8?B?aWMvUTZKcy9SWEp4TCtEOWpRK2ZQQjQ0V2hlVzhKQmkydXR2TzgzejB1VDlw?=
 =?utf-8?B?M0plbFdiVEVvQkw1WFdjVU12UVNXOHNDS0lCOGx2aitXUytpQlJxUCt2MW9U?=
 =?utf-8?B?cjY5UmdmaXJrT2MzUnZ5MlM2NXRDTkllSHNKMThxWE9RMTFTaGx4UHdrc2d2?=
 =?utf-8?B?ZWFQNU0wVlZQbWQrdGc2VTlzenhVeHdrOGFOekROTGtUZjFtei9GY2NxSE80?=
 =?utf-8?B?TTFCb0o4eTVUYnYxR1FqanAwczIwS2VFd0g0N1k5K21YcElOL1hvS3NrY01S?=
 =?utf-8?B?Q1NUVjRoVlRPMFM0TEszRG1wZ1NxS293dGh4ZkwyUFFvaXAvQVJXRHB4SlFM?=
 =?utf-8?B?WTczaE1QSmhNa1I3dzZ0dlI4WXRIUjRveVRWY1FyZjI1eGlQNHVVMUNESnht?=
 =?utf-8?B?bEZYMEdVenF6UTY4SVJ1Wmd6c1gzck5xZ1lTWk5GT2trVjVKRS9pTE9rNWVT?=
 =?utf-8?B?NyticlNhYklXRXpObEZmYy9PU0pMTmR5M3VwdmtnV2tYUE9sandERlJsK0pF?=
 =?utf-8?B?VWQwaTdXc3NRaUVyaHZTQURiajZiWmlZVC9rTnNETnE1ZnZ2R0J0VXo0bWc4?=
 =?utf-8?B?a01DYkVFT0ttNGJFVkFXRVh0bXVvaWRheldyTTRuVWpIaWdNR2FCU1AraXhv?=
 =?utf-8?B?WlJSTHg4ZUFjVU9jVEZIeDRDTmxwNGxhZnlwcC9uek5TZXE2ZGFyV2xUKzJD?=
 =?utf-8?B?MEl5WmNZNjJidmNrQ1pCVmYwRFp1bkx0QXVMQUdwQjVsVXhETnE3UUJyaDlj?=
 =?utf-8?B?VWFzeFlXYjc5M0ZGNEhUU0E4eG1DUldlNDZBemNJVG1KWUJKbGZocjhMT3p6?=
 =?utf-8?B?Zm8rY2d1ZDNqZUZLQVBJdkc0YmR5UWV1T2J2Q0xrVFFiU1JMNDVsNTloYkdt?=
 =?utf-8?B?V1RtZ3gvMmV2SDFROC9nZXBlWmZ4N1dMU2NFS2xqa0E4UHE3MUdXWVRMYU5U?=
 =?utf-8?B?VkNEV3pTaVNWQ1ZBckxacnpIY0wrNGt2bGdlRmZnUnFKRjNkanVPT3kwcWpT?=
 =?utf-8?B?MzE4cUNmdktkZUtBeGM1TUdWZnU3ZGdaZUZIQ1pnTlM2V0lwY1dQSTIzbEhq?=
 =?utf-8?B?Z0VGdERpSzhQbmVzMndQdDdEUDd3Mk8rU1BZbXY0QmZ5RVpCTGt0VkVJSTYr?=
 =?utf-8?B?Q3RlVlhNUVZGVks2bVpmOXlXVjJxeTZ5V1BVQk5PbERleGlNQjZZV1lYcERk?=
 =?utf-8?B?VHFIWGRmOWNYOFdjcnc3TjIrVkE4ckVIcFVnOUZvbTVZMG5ERVJYNWcxYmRU?=
 =?utf-8?B?VHMzTTR3N0s4T20reElZenMvdjc3T2xmRkZhVUxUOElDYnk0b2FwRnBjV1lJ?=
 =?utf-8?B?aDkzSUZxVzBvWCtPMExPMmZwc2ZOd3lOWWltSHlKRGY0aXRrenQyZEJyeWZ3?=
 =?utf-8?B?Y3JENEp1cFB1Y3hoV04ySUZyV3FIaEM1V2MzNjdYYVpRS0dTQXVIQ0JzT2Fs?=
 =?utf-8?Q?CdVI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDZUakhhajEyTkRQMHJJNWpsNVRhQTVCbWF6T1hyNDNnSmVhbXFjOTdjTmRR?=
 =?utf-8?B?ZEFnbGxqMTNFejdONXpOdWxRRiswTytPRGlNb3Y4eWh4VGxJaExURTRWNWdn?=
 =?utf-8?B?YXNiYWRCQlNSUzF3eU9BKzVqMWxpbHAvcVVSSytnY1Baa1p0bXcyekNub3FP?=
 =?utf-8?B?VnU0VHRZeFZacVlPeWRXK3NEYUJrTWF0bFZOVTlnVFdNdkRTU0VQWk52K1dO?=
 =?utf-8?B?blRtWXUzWllqbExkOGMzanlIckY4eGx1ZFo1TjhRTFNveitHY2ptRm9hek5F?=
 =?utf-8?B?Rk5ndHp5Q3dUSUV5ZndwZ21LZ0REbW52VXMxcjV4Z3VRYnErd1FHWFNzRmRt?=
 =?utf-8?B?bm1MbmxDOHdidUhoc0JRUk1CTDRPeE9ROXFySGJEYktzeExFQ3ZIREpDb1A5?=
 =?utf-8?B?eXl5Y2hoRHpDTWhXSDBhUUlhclEwd0tjbUU4UnkrZzlpVXhYTitDT1ZYbW9w?=
 =?utf-8?B?WDduMjIyOHVYcjVzSjVMOHl6OVpCNDRPazlUSlZFVG5hY21hMHE5U0Fqbmxp?=
 =?utf-8?B?OGY3WTJzdllpZTBkeWplbmlZZDlUaXI5NkdLRUQ2d1kzbFdKSEN0L0hsN2c4?=
 =?utf-8?B?MUdWbEJOSk8zR0ROSmlqRTRMcmFvWjhQNnJXWEsxdGhBMmZBMFQvWlVnZnZa?=
 =?utf-8?B?VVBCYVo2K0c2NVJ3cy85YnFOZzBUUnN6MjRRV2R0Y2Yvd3BtZjEzRmFlWXc5?=
 =?utf-8?B?M1ZybFh5TDJ1bjBDUXNYVGVDWmswcERIMFR2Q1hmTjVTWXZjRkVySlo4N2JG?=
 =?utf-8?B?NnJzRWllbWZkYXZMYktXd2d6R3VyL1p0T2o3YXNxMWswOUUxZzFFVXB4dnc5?=
 =?utf-8?B?MmFFOFVPODRURGdGVjdNcko3TURDTmZRTHF0WHVuTVVzNnNSTnJPSFUvK0RF?=
 =?utf-8?B?MC8rVE96aEx1M2R5VGl0OThTTGh6emhFcXZVYmdoOHNwTlFWUHByQjBOWkJH?=
 =?utf-8?B?ZjlOd1ZDck5Cajc0KzlzSnV4UFFLTUpoV0ZKbjNUYW1LdmhmR3U5cWtOdFcy?=
 =?utf-8?B?THFSYVZxLy9PbUlGQk14NmIwbFNUTUtOd0JFb3Vrb3ZsUXhGOGcyNXJITXd2?=
 =?utf-8?B?REhaa2tvdEl3VkdKVG1hNFRsUEM3WjlOanZGOUZXbCtma0ZKYXpqNk9Ob05Q?=
 =?utf-8?B?NXNhZkhlSlR0a2NqQWI3dng1TXFVUkpNZmNjaTV2OGdMcmhNUTlwL0JFN1hD?=
 =?utf-8?B?cWljczFBU09JZUkwdXRiL2ZmWlV2U2lhNDRMWmx6eXJSS0wwbWtrb25BU2Rs?=
 =?utf-8?B?ZWt0M1BZTFZXeGJ3ZFlRYkszT1g5S0JPb2ZwM3hTTHRJaEtuMG4xUnVoelBJ?=
 =?utf-8?B?ampaVXJuVTBYbEFHN2pON2NYYnlYVjdSZVNtcjRTdk9IY3hBUFJHQ045WFVW?=
 =?utf-8?B?TWZOcTlabE9hK3ZudWdzNlJYNnpBRWJ5ektiYzJhMmE5d3dQcjNOSHgwL3hP?=
 =?utf-8?B?dE14aDk3eU9IaWJDZktVZC9ReHJvTTFTRUNmRXNld3JBcG5RTmNEN3R1UmlV?=
 =?utf-8?B?dm9Kdnl4SkUxTVUrdTk3NWhWaEdzZU8vK2ZVeTJiUm1GYnNEMlk0THhGYTVi?=
 =?utf-8?B?UHpwRlV3aFkrVWRiMk5QTDltdlp6OTZxTGtEdW9RUGhkVmE1eUhZSTZGTEp2?=
 =?utf-8?B?UGxONm1NQ1hYd0dkZzRmeHdpSlozRlhjUkRZQXd1MmVYcXAvL3MyMnZsT05x?=
 =?utf-8?B?blpBaFcxb1FvQVAvTEUxdnJZcUtua2x2djRBTEFtZyswRE5QdTZ1MWZqRmx0?=
 =?utf-8?B?VUhQTnoyZUlKUlFTNmN1ZXo5dU1BVjlHNEI2Ym9aSzZmN00rOHluZFh2T1hz?=
 =?utf-8?B?SVRHa1FKcDdNV1U4TzU2U25KMXZnaThOempjVVBOTk04Zlk2aUFhUVlqcmNp?=
 =?utf-8?B?SUFxUHY4eGZUQjBlc0ltSDV3c0lwWEo4T2dDMkN1NDg2TlZ5eVRtZHJGMGZR?=
 =?utf-8?B?bnYvN25TeWxBakplV3oxU003Rk5MQlYyOUVUVEE5Ums1RHduNFBENUgvT0Yz?=
 =?utf-8?B?QndDWW9zSXd2Z2hYeEZvRnk4NGw0eU9wY2Z0ZTY0VkNZNXZFV1JIQ2hkVEZP?=
 =?utf-8?B?Mk0rV2phMmFqb0FNYW1JS29BN3k4Y3kvaWpUUUw0U0ZteVdpNzRXSGpGZ0Q4?=
 =?utf-8?B?MzJqT01XcDU4dUxSN1NGY2Y2aXhjaWhKQ01jQVhkaUlVMENRbWQzRXoxTmxp?=
 =?utf-8?B?TlIrczhXOTgxVmNYbTBKNGZrNU1tU21rTExTcTAvb3NZUFBkOFZ5VzRUTmlr?=
 =?utf-8?B?R0ZObGpybFd0WEZjcHJrT09Qa3lnWENsOUNxZnk1c0JIZGVLSkhoaFZzVWpP?=
 =?utf-8?B?VkErWkp4Z0pqMzBIVmpic0lZeHZjaUFIRE51bDlJa1M2Nkh4aUtDdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625309b3-b024-4103-a262-08de651e8139
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:24:42.6101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l80kCoFUyC58Q87iIZ0hicc9pwTDde62yA+glN8qBURtxZIQ0Iauje367E8OINdMBHoUr/2t5+QEkbgykZngjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087



On 2/5/2026 8:14 PM, Boqun Feng wrote:
> On Thu, Feb 05, 2026 at 07:50:03PM -0500, Joel Fernandes wrote:
>>
>>
>> On 2/5/2026 5:17 PM, Joel Fernandes wrote:
>>>
>>>
>>> On 2/5/2026 4:40 PM, Boqun Feng wrote:
>>>> On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
>>>>> On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
>>>>>> But I'm really somewhat sad that 64bit can't do better than this.
>>>>>
>>>>> Here, the below builds and boots (albeit with warnings because printf
>>>>> format crap sucks).
>>>>>
>>>>
>>>> Thanks! I will drop patch #1 and #2 and use this one (with a commit log
>>>> and some more tests), given it's based on the work of Joel, Lyude and
>>>> me, would the following tags make sense to all of you?
>>>>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>
>>> I don't know, I am not a big fan of the alternative patch because it adds a
>>> per-cpu counter anyway if !CONFIG_PREEMPT_LONG [1]. And it is also a much bigger
>>> patch than the one I wrote. Purely from an objective perspective, I would still
>>> want to keep my original patch because it is simple. What is really the
>>> objection to it?
>>>
> 
> PREEMPT_LONG is an architecture-specific way to improve the performance
> IMO. Just to be clear, do you object it at all, or do you object
> combining it with your original patch? If it's the latter, I could make
> another patch as a follow to enable PREEMPT_LONG.

When I looked at the alternative patch, I did consider that it was
overcomplicated and it should be justified. Otherwise, I don't object to it. It
seems to be a matter of preference I think. I would prefer a simpler fix than an
overcomplicated fix for a hypothetical issue (unless we have data showing
issue). If it was a few lines of change, that'd be different story.

> 
>>> [1]
>>> +#ifndef CONFIG_PREEMPT_LONG
>>> +/*
>>> + * Any 32bit architecture that still cares about performance should
>>> + * probably ensure this is near preempt_count.
>>> + */
>>> +DEFINE_PER_CPU(unsigned int, nmi_nesting);
>>> +#endif
>>>
>> If the objection to my patch is modifying a per-cpu counter, isn't NMI a slow
>> path? If we agree, then keeping things simple is better IMO unless we have data
> 
> I guess Peter was trying to say it's not a slow path if you consider
> perf event interrupts on x86? [1]

How are we handling this performance issue then on 32-bit x86 architecture with
perf? Or are we saying we don't care about performance on 32-bit?

-- 
Joel Fernandes

