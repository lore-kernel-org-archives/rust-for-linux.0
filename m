Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4919EEC2;
	Fri,  2 Jan 2026 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358444; cv=fail; b=TLDJlfsZ0wg47hUNEjb8iRL2t5e3wFwo2jG0pc4edoJ1SF+oUdfzkHqwiAn5TyBtFz0RBl8r3CqaF9BdGgu1fmVBLPJo3EV9yQPwWvyhRPHuYwac2O/T7RZC6b/ZyOQRQjl8S9XFjfc2b1UOADGyeCwZpBIt6PlZ0b2oasAFuEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358444; c=relaxed/simple;
	bh=jKWXeeeVQ8Pi66aNL0J6jeIq07+0iPThWFDz8QFCQ9I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iDvKvbqpc30guq2rLXF0EttRSwWS1YNVLHUL+W/5qi5eFKUJ0tEUHFvbqTihUoIZAESrBrSgRaGcBRFZ6qIqprFFTIqDyznl/Ck/EfkTo0wikbWtHFk6Paz4EExHw9JwMtnRkHAedRus4nylBp/5t6SlI3FsHVfRzI/XSqytnVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=x3lM4fI/; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="x3lM4fI/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjAiftE4QR2yAJTr1OuRAQigDJ+j5L4C50AX4wo/ut3fFj6Pg24KeOimjmZ/X1eUQyUrgVFjFnk0tdCkICx1N4yyfMmbjbYgluZEtaxTCNQB7svQcFgEviDWniUH9rsdTDgsogrOTHt2hr4+W2PlRWo0IAsQQKCSJbFFn83mhRVdwcmDQOEXLOdjkivC8A1SLsv3kviWfvZWO6Xgkq7J3nwYHfhDEgFpXlEB7rV8n//LDHmBq94dGpIdKnj2S4NJ1q6kr9iZK1Ftn+S1wksBlWOVhA3dxN36sUHuoMFvWyKlY/htk1iM8KIPBJwhwT6tafGK/xlexUsdsc6ikENlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4utQ8prgsHhXHG1+9Dve9SfgSosv1x64Rlm3HiJLYI=;
 b=Ul3VxZWkBXws2oCbn5VcCbvB0wIoaBVLD9AwH7+OfR7uMS+UMsdmslYeaPqQPDGRC3SP6VpHVZo1nJUKfhAZEUSVck3GrcTobAZOaC8xgaQ/mpOkBIDppy06j1KHKPtTVgCkrQTMw2yVRw34gxOTJ1B/uHIObLKZEi+qh8FeVR3Q09xylGY+YWdeEgOioOYsdQCfyWi3FlBeZWYevSwXwlHuMIjRX4RdnLa+odhtG1BoNM9eH7WoqgHMkSVShyIbRtmgoH+6NXB3j3BsjdyG1mMDLzzDKUubdpCXCfPNSxN8CSCwkbuFwR0CYXcI5h6oqK5O+Kf3hcZ6ddenS91oYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4utQ8prgsHhXHG1+9Dve9SfgSosv1x64Rlm3HiJLYI=;
 b=x3lM4fI/Fl+sBhLKxXq3n0X3h7+0+xKENoiuD5o0rWCkBJo/roPpf+8M7M9+SZ+nic4EivhL3+U466JxHdg1+xo4byuy/Nu0Cet9hzXe8kIWuW4QbcIp7ZW9RqpLiqNWR5QKrKDswz2+a13+K1SPtbFRcda33VjHcn4TRBM73MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7423.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 12:53:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 12:53:58 +0000
Date: Fri, 2 Jan 2026 12:53:57 +0000
From: Gary Guo <gary@garyguo.net>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Filipe Xavier
 <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
Message-ID: <20260102125357.402c0e15.gary@garyguo.net>
In-Reply-To: <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
References: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
	<E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com>
	<CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0239.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: f2840123-b601-4005-06ca-08de49fdfef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnI3RVBtYkMva3NHUG1qOWtiSTBpMXhPWXJEQkhYNkRCcEJHbjJsR1JIUVVu?=
 =?utf-8?B?TGZiZDlMSVhMU0JMdEUyRDIwUlAySzhhdXBIdDR0ZFJUTkpvbkREemF5bmZR?=
 =?utf-8?B?M2RYTTVWb2dOeXN1VFkweG1JM3NWdW8vT2tMS1g5akpiMzFWTWNaRzk5cHRk?=
 =?utf-8?B?ck5GYm9MV2g4Vi9CMTgvaFk0amFna3pJelZBZWJERWU5b3ViT3ppbE53TmRE?=
 =?utf-8?B?c3RjbVVNa0VFc0NsQ2k2dnpMckRHTnRMRTZScGx1UmNRVXkwUFQxYnZKckdR?=
 =?utf-8?B?cnovYXU1cmNOMWtVUGNwZlY2YWwzT1BxZC93MmwzaGl2bmhHNm5jUGFJU2hk?=
 =?utf-8?B?RVlmWXI5amVickRXQzBPN2lBamo4SEZwY3hPY2RydDR0TEFwZi9EeUU2cXBz?=
 =?utf-8?B?QnpyNnRtSnFjWUg4M05ldXg3QytqZUh0WkVWZ3BaMzdRZisybmdySk9LaVVV?=
 =?utf-8?B?RTRUb1J6QVUyU2hmOCsyMmJjWHhKWjRjU2tqN2V4VXpGdE5ZeVQzdi9FSUdT?=
 =?utf-8?B?aXBtbEVFNHhIQ1MxT0J4aVg0YTU4dkFNZU42clZiVkhrNjVFaVQ4SVdFTC9r?=
 =?utf-8?B?eThRaU9udVlQVU01QXZXYXU4akgwNkdsNkJsam9EOWR3QXl3NnRNTGFiclVk?=
 =?utf-8?B?NVc1OFpwNTV6Q0tMSUJnTFFZcFFsR0hLM3BKdUpRNjZpYzRTSVBIdS9rUWJG?=
 =?utf-8?B?N29TTkoxelR2b1V4MGthTGVDV2FLZE9ua1lyWFh2YW9MUzV6UDhuakhyV2E0?=
 =?utf-8?B?RkdTdmp3c0RqRnVEalI1cEN5Z201MzBPV3Q5KzNZMHRZZGxoaVZEMlhVYXFv?=
 =?utf-8?B?MmF2MjdDRG51UFJKS3Q4b3RZVFNIbTh4RGJhdFVkeThaMVFUK2tRa1lsVlUw?=
 =?utf-8?B?cXUrRjl2dnovQUVPTjFVQ1ZtYWNHdkFyMlN0ZW5nbkNkNk9yVXNwTE1OR25R?=
 =?utf-8?B?NjdMRzJOWWpubUNsK0FwV0FZeXdiYVBWclM0SlZsaXg0RjFkbTQrL0tBY0lR?=
 =?utf-8?B?QmQyNEswdEpQWXNGdlFpZ3BTRVNZSG5YVC9QMWs2bHhVUDNsZW1HOU5kSzN6?=
 =?utf-8?B?RXI3VU9wVW5SaHBuMkVLNzRwT1IrVm9HK08yVDlFcmRrckFVNG8raEpRVjVt?=
 =?utf-8?B?bDQxNHlFQitlUGIwTUVkYVE4dEtiUmkweEl2V3ZrYkwvV0dXZURvdy9VVklG?=
 =?utf-8?B?eFRGZ2dUa0tPMHlCQm9wbndBQ2l2VUZyWWZJQVExZ3VmbnJFZkZtU21Sdk5a?=
 =?utf-8?B?T2RWVnV0Q1VuMXpGOVpsekJreFQ0QUl5YSsvcnB3ckJuVXhjV2srZTUweVpu?=
 =?utf-8?B?L3lHVGQ3ODZQd01QZ0xtSXhPdjMyT2xMczdtRXJxNjVJMUpNY0tMVkJzdnQ1?=
 =?utf-8?B?RUdqZ3NOWHgzcjY5cElZM1huRUFsTUZJekZPT2xiRjZhajJkMWJIcDdrZTA4?=
 =?utf-8?B?blRZTGdTSFhpR1Z6SlR5ZkFSd1lNT2QremhDYWZDdGE5em5uaEt1U1g5UVk0?=
 =?utf-8?B?WHpRd3U3eENUVDZVWFZxaGJBdEkwZ0FUK21JSVVYbE1NODQ4VjBCa1ExT012?=
 =?utf-8?B?UDUxTTNDSEo4VkMyR1VWYURiOVhrQU1kcGpua1lQZTZQSUF1WHB4VnhYUkN1?=
 =?utf-8?B?TGZkZDBqMnBSZ2g3ejFLaGlhZEg4WmZVRERwZ1pBLy9STHZrYXJxY092MzRW?=
 =?utf-8?B?YnIrcnZwbEdSQ1pLRWZmTjhhMXVDeWxOYUpSVlhQK2dOVGlyTVR3NlJ3RDUr?=
 =?utf-8?B?b1dLeEhMNHcxeEh3SHJKb2FxUGhFOG12dHJqdzNGQ2Vxa2hhdC9BL21ucnI5?=
 =?utf-8?B?cEQraXF1ZmF2OWo3UGxKaFVyM3QwanRPajRzdFRyc0MwRnQvZ2VCME1jVUl1?=
 =?utf-8?B?S0VTRFBSSHoxQU91RTNUc2s3b3M4Nmh0KzRZNVZUQXRSSDRwaTNpMWdIVDcr?=
 =?utf-8?Q?WfDYZ0RaxEEWSJc6jpXkSZtiIzG4EWAz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1BnM2FTdWx4SkoxM0Zhb0lRajBoRnpWWXp2bG5RVnVaQk9qTTV0VEptQmhy?=
 =?utf-8?B?N0pyV3RYZ0lEUmJHbzJiME13WEtER1pQSHd5cSs3UTBoaitDSysyeE5BQWov?=
 =?utf-8?B?N1ZlV1hCN0RWYlhzU25RVW40aUYxZmxOa2pLZ0NTdnNaaUpad3FPVzJIdmg4?=
 =?utf-8?B?dno2cmJTSFJPeEpmWU9TZ1RGQktSakQ5Z1U2c1UraS93V3gveEEyN21idXJu?=
 =?utf-8?B?dXpOM2RiQWhVTWp3UzR4M0djK3h3UU5WSXNFTXM3QnZwWDBrZU5wY3E2Y2oy?=
 =?utf-8?B?S1NFRVZGSDJma0Q1ckU2eDJSeUFhZEJOSUlMVmxTYTFDb241VkFIR2ltZVlC?=
 =?utf-8?B?M2ROSnU3V1V6MTdBMUdySnp4cnRLbWdwN3ZQYWd5Uk9xMXN1V2N0TjZJcHEx?=
 =?utf-8?B?VXVIZVpIMGp6dlp3TTVSVi80SHkyQml3UlcvZy9HNHhrMytQNXhLekU2end5?=
 =?utf-8?B?bnZKcWRnTW5PU3Bra2FTSU5CellEbURsR2ZQdnZWaGptdURHNE4vcTlEL1dT?=
 =?utf-8?B?RWduY2pXd0tMTXdsTVFHU1czUm5YWnBWaUR3aGhmWHJWK1BpcHNFdTc3VVI5?=
 =?utf-8?B?VmUwT2FBUXVWQTNUaW9KRTZoeVllK0VHNjBCbUcxQ3p4ajk0SEtodkU5blFJ?=
 =?utf-8?B?OUU3czNqV0NBbWtOVXpTQWlBUmVQUGl2RlpwS1RrM09JRGFDS0hrME9VWUdX?=
 =?utf-8?B?S0E1azk3RHptemF5N2E1MTNoc0ZwMW94YWExZ2ptRURRRDltY3o4L1lNc09B?=
 =?utf-8?B?eEZKeE4zU1dqcGxZTmVyNDZTRzJNaHhFOFBMaTNieFlXZ2cvQ0VCWDdpUERl?=
 =?utf-8?B?MkdrSHlnL1JQTUY4dVZ0Lyt4ZUM3N1VxZmJPOHlCdm9RbUJla21ZWmxwQ2Fj?=
 =?utf-8?B?TjRuVEpVTzlKWE0zYmR1TEtsK293ZituVk5lU1ZJejJCanlFaHhLcFNDZXg5?=
 =?utf-8?B?eHpzZFo4SkhCU210NmVGSWYwL3B0TjZDQWJmM1N6WThBVVJuWDU5VCtmK2c4?=
 =?utf-8?B?ZVJvL1MxVUFjNjJsYlAyejJ1bzZjTHAzT1pLMjJjZ2dCMnpFT3lsWjhqNHBv?=
 =?utf-8?B?RDdrdzlmOVloenNPc1kwK1hRUHp6SDNhVUE3L2Y4ekxUM2RNUys0cFhMU09w?=
 =?utf-8?B?N1lwenYyRkZnVHNzMG9NcWpvTElUYmkzY3E0WVhxSXlSajhzOExOTGlLUVY2?=
 =?utf-8?B?SXdTODBYbUJtL2pKazJJMnFiak96Vm04MzBkTytsNEpXanA3S2JsRVppZS81?=
 =?utf-8?B?c2llUDFUUGR5KzBJaDEyRmt6ZG5lS0xlbFNaRnZ0Q3NyWk1WNEFWL0VFR3N1?=
 =?utf-8?B?UzArbVd0cHN3MllVS0FOZCtXeXEwWjYzY2hQbEpWUzJoUktGNXNpMkF4aWM4?=
 =?utf-8?B?cERIMmcvZ2RuLy96elJOeFZ6blFGTzlJR0UzLzRuc3NGeEpPQWNJMmRHd1Bs?=
 =?utf-8?B?MjdsbEcvTzNvaTIvWlRpS1dmSHEyUUVjZ3VhclRIMFYxVTNUSUZKcEIvcTZP?=
 =?utf-8?B?WEx3MTRMOHdONEdveWEvK04yS1BmVlBQMWp5OGh2TldRclBpMnhid0F6RElm?=
 =?utf-8?B?TktCdTNqQU1pSXhwYnZuRG0veHQ5STNIaWMyd0FNOWhyYWtyMWg5d0RHOGw5?=
 =?utf-8?B?VUVURFpxNmRwb0IyRXFJWUFIR2xZUWRySi9DN2pJWGZaUGRwcFhYbHRFYUht?=
 =?utf-8?B?M0cxazlrQWlINkxIbXZLRlV1RmEzcWYwNWNEaGNQQ3BTNjFNVnNaNFczcDNq?=
 =?utf-8?B?SXBJcmdYa0paak4wUVpPQXJtY1NtUWlTVmszK0E3K29ibUZUTmM1QnI0eWli?=
 =?utf-8?B?bFA4SC9aTlBTZGRGeTdJdWMrb012cFlpWWYvVmltTjVNclR0YmwxUXEvMlZ4?=
 =?utf-8?B?QXpZc3pxYTNjaGI1ZnhzOFV5Qmo4c1dXcnN1dS81dGhjck9weWlKYnN0RVh0?=
 =?utf-8?B?K3VBcnBPQ0Q3VWNUTWtBSkVpbHJJYlJNRnFUMCtNVVpGNWhPU0lJSEQzdU1W?=
 =?utf-8?B?V0phZXlxRVRnaDB2NGIwRUlhdGNzMGlFVmZhU1Y1dHBTZ0dWVVI3RmFhaXRI?=
 =?utf-8?B?Mk44S0xJaTNQWFZJRXZCZG1DWjkwaGJDcU5CNDlwVXozVmxDbkU2aHY0TG5w?=
 =?utf-8?B?dHk0YWlINWpqQk9TaHB6aDY5Si9nU2NwRndUYmx2S0J6VHp5L3ZkQTM5Qklm?=
 =?utf-8?B?NEFTbS95UGRhckRKWUs2OUdwamdvWWhiWGVMc1ZxR25tTFJJLy90STZlQWdL?=
 =?utf-8?B?SUxVTUdhdzdkcmp1TjdHVWdPSmRGWForMU1MSzM4cm1EY09tODRjWlhOSlZt?=
 =?utf-8?B?ajF2bi9GOXlyWG96NEZNYTkxbzk5TlBkWXRZWjhOZlVNK1N6RDdqUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f2840123-b601-4005-06ca-08de49fdfef4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 12:53:58.7261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMBWpwzH/4qhurtvS/ELgoZly8Pj2QfwpW8Hbw0grtiLdq6HWVfaGEJ7sL4Kk1W09yODICb02P04h/4SStqMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7423

On Thu, 1 Jan 2026 23:39:26 +0200
Kari Argillander <kari.argillander@gmail.com> wrote:

> to 1.1.2026 klo 22.23 Daniel Almeida (daniel.almeida@collabora.com) kirjo=
itti:
> > > On 1 Jan 2026, at 16:14, Kari Argillander <kari.argillander@gmail.com=
> wrote:
> > >
> > > =EF=BB=BFOn Thu, 1 Jan 2026 at 20:21, Filipe Xavier <felipeaggger@gma=
il.com> wrote:
> > > =20
> > >> +/// // Combine multiple permissions using operation OR (`|`).
> > >> +/// let read_write: Permissions =3D Permission::Read | Permission::=
Write;
> > >> +///
> > >> +/// assert!(read_write.contains(Permission::Read));
> > >> +/// assert!(read_write.contains(Permission::Write));
> > >> +/// assert!(!read_write.contains(Permission::Execute));
> > >> +/// assert!(read_write.contains_any(Permission::Read | Permission::=
Execute));
> > >> +/// assert!(read_write.contains_all(Permission::Read | Permission::=
Write));
> > >> +///
> > >> +/// // Removing a permission with operation AND (`&`).
> > >> +/// let read_only: Permissions =3D read_write & Permission::Read;
> > >> +/// assert!(read_only.contains(Permission::Read));
> > >> +/// assert!(!read_only.contains(Permission::Write));
> > >> +///
> > >> +/// // Toggling permissions with XOR (`^`).
> > >> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
> > >> +/// assert!(!toggled.contains(Permission::Read));
> > >> +///
> > >> +/// // Inverting permissions with negation (`!`).
> > >> +/// let negated =3D !read_only;
> > >> +/// assert!(negated.contains(Permission::Write));
> > >> +/// assert!(!negated.contains(Permission::Read)); =20
> > >
> > > I really like the OR (`|`) operator. Personally, I don=E2=80=99t like=
 anything
> > > else. When
> > > a function or expression gets longer, something like let negated =3D =
!read_only;
> > > already feels strange to read.
> > >
> > > My suggestion is that everything else should be functions, so we woul=
d write:
> > >
> > > ```rust
> > >    let xxx =3D Permission::Read | Permission::Write;
> > >    xxx.remove(Permission::Write | Permission::Read);
> > >    xxx.toggle(Permission::Execute);
> > >    xxx.invert();
> > > ```
> > >
> > > This way we avoid expressions like:
> > >
> > > ```rust
> > >    let a =3D !(!xxx | yyy ^ zzz);
> > > ```
> > > =20
> > =E2=80=9C =20
> > > At that point, no one understands what is really happening anymore. P=
eople start
> > > wondering whether operator precedence or evaluation order matters, an=
d may even
> > > have to go read the source code to figure it out.=20
> >
> > I disagree. How would that look like given your suggestion?
> > =20
> > >
> > > By only supporting OR (|) as an operator and expressing everything el=
se as
> > > explicit function calls, the code becomes much easier to read, review=
, and
> > > maintain.
> > >
> > >    Argillander =20
> >
> > How is A | B readable but not A & B or A ^ B? =20
>=20
> Because that is just a way to express multiple / group of Flags and nothi=
ng
> more. And thinking of this it could be even & operator. So we only allow
> creating / enabling / disabling / toggling for a group of flags. Everythi=
ng
> still needs to be explicit. So we would end up with something like
>=20
> ```rust
>     Flags::new(A | B);
>     toggle(A | B);
>     disable(A | B); // Or remove() (I do not have opinion)
>     enable(A | B);
>=20
>     // I would even consider & operator here as then you read it quite ni=
cely
>     // toggle (A and B)
>     toggle(A & B);
> ```
>=20
> Most annoying thing with flags is that if you need to enable 8 flags then=
 some
> operator becomes a must. Still using those in everywhere is error prone a=
nd
> confusing. So I totally agreed that we need some way to express group of =
flags
> without always doing something like "t.enable(Flag::A).enable(Flag::B)"
>=20
> If this way is used it is really nice that every function get's documenta=
tion.
> If we only allow | or & there is very little chance that someone mix what=
 those
> means as it is always documented function call. Using operators too freel=
y feels
> very C++ in my opinion. Rust is very explicit language so let's not chang=
e that
> but let's still make it usable for our cases.

I don't see why using operators is C++ specific. You do use these
operators in C, too.

I would rather write `flag & mask` rather than
`flag.remove(mask.invert())`.

Using operators make the bitflags nature explicit to the users and I think
that's a pro not a con.

Best,
Gary

>=20
> If this way is used it is really nice that every function get's documenta=
tion.
> If we only allow | or & there is very little chance that someone mix what=
 those
> means as it is always documented function call. Using operators too freel=
y feels
> very C++ in my opinion. Rust is very explicit language so let's not chang=
e that
> but let's still make it usable for our cases.
>=20
>     Argillander

