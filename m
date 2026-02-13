Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020099.outbound.protection.outlook.com [52.101.195.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043C31AF1E;
	Fri, 13 Feb 2026 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770972783; cv=fail; b=uLk0tCPt0kAEYbq22a3zXWYnMfHF1240XRmBVROqy4QUvBwfdoYh5CI61mfPOY/x4QUcbR62FFRfZ95SZ6NSPg80FxHp+Vm8RC4moQWEsBeh67LAeLTKR6M3T6Uwb7wDDcxGO+4330oALYOUuzK29MS8olO4v/IndYE2u+lrm1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770972783; c=relaxed/simple;
	bh=REI4SjPNR23MQFaFDzoZn11DWwFRpyp4VgIeu8AoB4A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PTZLKohkpcbp+CJAffx9lKH26YRbu7+yUZalYXKU9ghFpEfb1XbXKq8562KcyN/Cna3hfEufqyYYh5wk7il8l6IMQDB6mRlBvTv2P/mcxuXrEvCnbz5X5damoPmNWDPTetVXisF69Ga2xWh1R1bs6hg1Sr8bLDDseGvkmU1Ya0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=azFIo+f8; arc=fail smtp.client-ip=52.101.195.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="azFIo+f8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebSzv0AT/wBq6vgU8o3hiT627JEHdc1Yp9jgXeFL1ZJS3TguHzwJVIeL+iIPJfkV4aF58tg3AcgNMhvyVWpQBFqdIZlnI3YHyPemEdH5LL6FllArsidOQit/jJK/b2ddxIB+aXuO0+WpO9kZoPaB9pKYZr904InPFpNM79VjrX87B4Hk6Tetsfj7zXo3j8cWWF2TYUWuS4sgs+xFlRXjLwi4B98XrkzY9lQZQ5wepELGodS9dIYQ7JTKI+bzU7XlEtRVdE15vIPJ6fvOshlkwfBI/SU/SZeGPZxxJMUXRvxbznjmaV6eLU0SMUgc9yhX7cwT+EIrHizCOv6uOd4BPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SQPZB8UYXpOea34MYemrwmfzDhjg0Gqg8R0H7ZMLTQ=;
 b=d01M9qkOKHxQGrDeoi7aWTHl5dd1j0XGvUdH2V6HZF82+tyFkJVOnQZBh1fpgvp30smhsEazIlRahcYYzKzco4KX76ZLha9gYN0RDTdkaOSEi1N39Rmu8Q0Wkv3ZS62X3MsShk7TBZyw0FfogeigL0DnqY9agj9vQBkMHahZ0NJb5OhDEvv8EJbgzXALelXsYMiDFLDouJjjQ1mqZW2MaGT0xTwd8SRDmFNA2qvmihietZ1Gi+4GJmsOhIIDJOWH4tQpEbYTiDU32D25m7gIt8xB/7uvsPCzYNGJs8IN7zV2HK6ns7KAjw+7kWGMH0Njckto4dMdNaPu3mLDImDmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SQPZB8UYXpOea34MYemrwmfzDhjg0Gqg8R0H7ZMLTQ=;
 b=azFIo+f8tHyFLb/J2hrvwrOpiAQfnk3zCz+c0xn3dWfj3PA/sX8hU5Vo+uIJQIUlsQFxJIh9WSHSabdDrxDaatrJttB99+vS0d/EwF5IH33WldJ3UwglxxnVZwvhX5NXn/3NYjqFJ8yFQUFM4pgarr+sa20uD3xzsmEGbILIDZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9316.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 08:52:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 08:52:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 16:52:45 +0800
Message-Id: <DGDPG8TL1IGS.3OVN0KU25D9YA@garyguo.net>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@google.com>, "Carlos Llamas" <cmllamas@google.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Christian Brauner" <brauner@kernel.org>
Subject: Re: [PATCH] rust: task: clarify comments on task UID accessors
From: "Gary Guo" <gary@garyguo.net>
To: "Jann Horn" <jannh@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260212-rust-uid-v1-1-deff4214c766@google.com>
In-Reply-To: <20260212-rust-uid-v1-1-deff4214c766@google.com>
X-ClientProxiedBy: TYCPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:1::28) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b830701-638c-42ee-8725-08de6add4948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b05jdVEzazhvcmxUNVg3d0x5UGNmMHRXL2k2NnNMT1RjN0YyMWNueHlBRDVy?=
 =?utf-8?B?UkpDb3JIalhvL0tObU1VTEN6bThBQm1kTENGWGVCT1o0MzFPTFlHV0hFY2Jo?=
 =?utf-8?B?cGlhQW1DNGlBQWEvSDNNTUdmaDdZZFBmcWdlaGttcW5VaG81dkg2bzhxMG53?=
 =?utf-8?B?dVlDZm53Sm12ZitQT0FuWXBvNlowenJPVnJVNHREblkrNXBmVHJWcGNNZGdk?=
 =?utf-8?B?eDNhcDdIaSt3cENoMlhGRGlnbzVWNDJRckx4ZWxUaGNEYmpiODQ1M2p0TFdR?=
 =?utf-8?B?UU5SQ3Nyeks1MlhPdE1hUS8zZllvMGduRGt1a0RLZTAvZ01ZWjNjOFk1SUdE?=
 =?utf-8?B?eHBaYzZPUlZ6bEFFdjVKdzJkeDgwaXZYRFE0ak5XQ3hSVDhqQnJuM2RLTHJN?=
 =?utf-8?B?SVh0YTA5VGMyeG1zNElHdTVBZTZUMmtPUmhkNlA3c3crNkRmOXY5RFpLelAr?=
 =?utf-8?B?dEgxSDcwd2hDVEorK0xERHMzNlg5b1N5ckU5ZEZSMkxRYXRyV0pLVCtURlZ4?=
 =?utf-8?B?clNxNjlwVkw5QkpKaUJVcG8wRldnajZBUUI2RzNBdDNpSTFJSkhjUzZ5bXNk?=
 =?utf-8?B?Wno4MkpMSGlxTGkzRTdUOFhJem9GWDJWMlZjclJGVmVEUnY4VllVWGczUXZT?=
 =?utf-8?B?VHdyRGdHSWhiOEdtem9KTDlZOHpHbFp0ZktKeEZQaXA4VmVYbzhJYm83UGE1?=
 =?utf-8?B?WXltZU1iM25PYjhHdHUwQ01NREdvUTBzWFZmZnNVWHNiV2R3WFFZTHlHZk8w?=
 =?utf-8?B?WFN3bkRLZnEvcGZ4cUdacnZPOGRwMjJSclNncXVYTHB0WTNEWXhrNHkwVFVr?=
 =?utf-8?B?b1Ewamg2alUxcnN5TTUyU1E0UjlocHYrS1dvQlo0STlpZWIvYlRpWlRMcTEx?=
 =?utf-8?B?MFdySnZYdlhhWStIVnBNT0xZY0ZIVHRJK0x0eEh6OVlhd3RaYzlIemlIRTdr?=
 =?utf-8?B?T2RQVGZQdlBKMjRZWjFoOWZYY3hUcVlzcnV1R0lQeFdrQ2xicm0vaWdYTDNl?=
 =?utf-8?B?ODUwa0RKVmZaY2FERGNQZVlkZTNZays1ZTVTbUdzU1B3MkI1ajVhd2FITnVq?=
 =?utf-8?B?bTRNUGhlN2RKS2dWVGVqMVBZd2tDOXBqYzc0TVJpcWQvbTZIbnVLUWZncm51?=
 =?utf-8?B?SkUvVmgxOHUwNkhpZU9oZEc3azFvLzJud1lBMzlXSUFpc3FVZGE3NUF6TzZp?=
 =?utf-8?B?TEIybVlzOEFRWVFzaXljb1ZDU2paZ1FWYmk1b1JnTnAxK3RqdXhwcnFkTE5I?=
 =?utf-8?B?R0VNZVlrQTZPNGlCVncwN3hCSWRlV01OS0JOYUJ2bzg2TXgvMFE5NmFZOTBv?=
 =?utf-8?B?QlZXMFoydVFWUTJIeXltbVpZZXgwM3hkVDVpR3ZKSkVuYnNrdTJaaUZHd2Mr?=
 =?utf-8?B?UFRpQTVTcVFmcDlndHA4VjRGYkpVQ1VMemhUYWk4aHpHSG4yT2hkNk40cDRj?=
 =?utf-8?B?L3czWW1Rc0o5OFc5UUYzSkcycm9FVisrU05Gdk5rVmROcWg2VTYyYUtHOFFK?=
 =?utf-8?B?TTZ6WU5sNzk4TWpnc1lKT09sUzVVZi9xZ2phZGFSQ2xwbS9HbWMzTHRHTXor?=
 =?utf-8?B?M1hLQTRZWllSQ2VMbm1ZZVAxL2NKcDJaSlBzL2pRNk9uQTl6MEIrVVM0K1ZJ?=
 =?utf-8?B?YTNQbng5YjF4RWcvOUJTZElCMnZGdDFSOW1hMWxsM0Y5Z3JUMllIKzRremVM?=
 =?utf-8?B?SUQzbnpBQmNtb1VCb3FNakhQQ0VpaXliNkJmNkdHTDYyL0ZuRFk1T0kvOVVM?=
 =?utf-8?B?NlM1NnVRSEk4cjlVbTB0MU0wT1hWdk5aZmNGRm5PNHJ6cW9MU2dZNG81cGVn?=
 =?utf-8?B?bEkrRWF3V3J6YUlLblpIV3JNZ0FicEFTTnd3ZjBlSzlLRm85ajdiMXpacVNH?=
 =?utf-8?B?d3VQOFJUckFjRmRGTEJuRERrNjFFd1lFbkRkalMxYWFvZEdzNHE4YnFTajhW?=
 =?utf-8?B?eUgrVndibWdsSncrckIraW1neFFxcC9ZdkxVbTFhN3NyQlVMTEN1MDhtcjlY?=
 =?utf-8?B?aU9OblNNY0ZRRUJyUFBPRTR6VnNlY3NWaTFURkVuN1BxMWlqUEsycXIrMXl4?=
 =?utf-8?B?Ti84eStoM0hnR21RR1lWam5BZ0tNUFRqMWtGdGVBRndWVUljS3VDTXhSNWlQ?=
 =?utf-8?B?UmM1aE1zWjdEV3lTbk5EU21yYWhJTGk0TFdiVXZJTTVPZTI5SVlwcFRDaHRM?=
 =?utf-8?B?R3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJuY3VLa3VRbnQ5VVhSbnBMUjRNcWxrZ3lCSXF0WVV6amI0Unk0VTNHS2x0?=
 =?utf-8?B?M2pwUEpZZ2RvTEdpdWE4L3pROGtjS3B4WDBiOGFOVlNGTVpBMDR1Zzl4M2lx?=
 =?utf-8?B?WndTSjJKL3BJbUQ0QTZDb3RCK0xBcW9vQWFxV2NPcWJ6TmFkR01wMlVHUlhx?=
 =?utf-8?B?c0RMd21ySjJyalorY0t2UmJiNzJ1OUM4R1h4ek9ya1l6SmlxZlUwK3Qyek50?=
 =?utf-8?B?R2VqZEEvTmJlSFhZUCtLSGcxM1pzWTRZRk9PN0lnd1BSK1N6OWZFRHNlQ3Ay?=
 =?utf-8?B?OWhWdXpkZHNzMFRKL2FjUzY3QXV0K0RTWkRjQ3pPa2xvSXFsWncvS1BUcVox?=
 =?utf-8?B?bm5ZNUtDdjdCTkV1TUViM0l3ZHZUSUUxQlpFN1loeTE3bUZvR0NLdExVWjc2?=
 =?utf-8?B?WDhjWFFiVm15V2FNZUpZMkJUWWlPbGVCb0IweEVSelRwQ051Z2hKU3IyZHA5?=
 =?utf-8?B?Vzg4ZjNuSFBDcE1KUFJ2R3JvRUZIL3RGVjFvWnZsQ3Y3ZUxHSllzQ3Y0MWtU?=
 =?utf-8?B?Z29oSzFIVUNmU2RkaXNGdnI3aGVWeFFQVmdNeVpxRERwQkxkaVBudXcvaC9u?=
 =?utf-8?B?UzY1em9mdDdueEJ1dm9ON2M4WEJLbHI2VXJlVjlSVm05MG1YREk5M29scGpW?=
 =?utf-8?B?QTEwNjQ2d1Q1QXZJNXpzdFhoUXBpWERGZzArekE0ZExhTWdER05iUVNDVExr?=
 =?utf-8?B?LzdvN0VhZTdhUWdrQ1JoaGdZUGk2QTR0SHdvZU9janh0aGRtZUorSTBLQW5F?=
 =?utf-8?B?My9tT1dxY055Y0E2L2FjVnRtT242aE03ZGV0K0YvQUNWVHVSUnZRYktXcTQv?=
 =?utf-8?B?cXJsZE1ldEEzMGF3enU2UUZjZzVNakRjNnpQQzlWZmRjTFVCNHpwKzg0YVpD?=
 =?utf-8?B?ak9idUJCQzZsS0habHE4bEN5UWE1Sk9vQ1M0WWxJSEttZ1ZOcjEyMERZSGp0?=
 =?utf-8?B?VytRNEl6ZENOSDk1YnNRZUV3TTRLSk5aMTR2UEtoRjZkZjBPQ1FZYW5FNk9k?=
 =?utf-8?B?SFcweHVxbTdHWlVFeEhBRENTajZ3c2JHZERkZHpoY29FL2ZSRUdWUGdsNGVv?=
 =?utf-8?B?ZWRqY1NlL0hHbVRBQXU3L2FuT2plOXFyRHo4bkkwNnlYNWtHMTg1Y3MxUCtJ?=
 =?utf-8?B?a2l0VE1MVy8wNUpCU0JRbnp4ZFVXNU94OC9PMFRWa29FSHRPN0ZRRFJJVjdZ?=
 =?utf-8?B?U2lUdEU1ZEo1ZytlaVIvR0VQR0JUK01LQ01zL24wRGdwYi9oUkNWd211bmNi?=
 =?utf-8?B?MUxjenhlNEVIc2dCTjVpVEFoV2UxM3lObDJ1Y0c2ayt1emdMbzA1TlMzcWdT?=
 =?utf-8?B?NFNCZUYwcWFtaVFpc3FUVkhxZVpHRjE0eWJiVy9MYmhpUkNiM2VWOGNkNUxW?=
 =?utf-8?B?QjRwYVpwQ2FKY1p2SStUY2xRQU14M2o3VVY0WWRGWHZyQTNNWDRrYVZkNlgz?=
 =?utf-8?B?cm9LWm9iMnY3Wis2WGVnU0Y0NUNWdE4vUG5qT204MDdUeFVnYTBFQ25PdTEz?=
 =?utf-8?B?T3JHNXcrQnhldjdZYWxLdk1oYVdQem1id2pXM1RZaUF4MWxaVTF0UU5JQlpq?=
 =?utf-8?B?bEdwYU1GNzhzVHFncGxTMlJVWUU5NXl2SENGQ2RqU093M2pxSUNQNzduczVh?=
 =?utf-8?B?UkhzakhZNzZIUlgxQ1NrVlczMHcyZkkxNHIyVnJQNHZITmpROUxLQmhBWnhD?=
 =?utf-8?B?UWx4L0gycDdoSmFFM2ZJNXp1Nm5NM1dvTnp4WS9aOEFlV3p1U3dPcXlXMFdD?=
 =?utf-8?B?OG1tblM0LzNjend3eDRTcWE4T1NhTmVuUlhFREZ0WEVxQTlJS2RJYzdJdzZE?=
 =?utf-8?B?UkFQcFFwZnZ0Y2phYnRZSkJRNmRtMlFMUUgweDhjdDREQnhQMWo1WmFlU1pl?=
 =?utf-8?B?aDRack85MWplNkVDLzFxVWs1OWpuNWRxZ0FSZVpWR0EybFJqS2p2eFV0NTl0?=
 =?utf-8?B?SGJXcmlVTDVma2JoVmU2bTIzUW1TaS9TbGtVU3dxTXBqckUxSnR2VDhKQ2FB?=
 =?utf-8?B?SlFva1ZFWHRUYjd2cUlJOUxLT0loRHFmZ3FCRWNsbTFqbnJDcFg0UEJiakRs?=
 =?utf-8?B?SVFHZzdVRGhjNW80NlBaUVFPSGk4K2o5enZIWHJyQm5DRnluWVNZZERMSjRl?=
 =?utf-8?B?YmVSUHJNVDU0UzhmQXdXN1lrWTkyMWc4dWkxMi90Rk03KzQ3ZlVaR3ZsMzFD?=
 =?utf-8?B?WFhNM0hINHBKTndRMUFpWWNEbHBDcGVJSWc3VVl5cTdmYWRMbzlMbTkyWlFw?=
 =?utf-8?B?L2xYVVlxUmQwM3J3Ni9STTVSVWpER0dLQzBERzRCTWlPS215VHh3TGNEdDhX?=
 =?utf-8?B?cFhjMHZWTmpmOUNEUlVYbHQxM0lpWDUvSnFFdEZDNkdRTDZEeHRGTXROKzRX?=
 =?utf-8?Q?mSIW8cdjK92eXl5MA06BPkp0KkR6mHBTGc8Zy?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b830701-638c-42ee-8725-08de6add4948
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:52:58.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/gGLDpaGH7Paoc6CWNZ3kYdTFNFLpVx/6EDi9OZ55vBGPuDBPsgw6qBpvucYYC8pY/SM8I81hu4xCOj59NIdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9316

On Fri Feb 13, 2026 at 2:00 AM CST, Jann Horn wrote:
> Linux has separate subjective and objective task credentials, see the
> comment above `struct cred`. Clarify which accessor functions operate on
> which set of credentials.
>
> Also document that Task::euid() is a very weird operation. You can see ho=
w
> weird it is by grepping for task_euid() - binder is its only user.
> Task::euid() obtains the objective effective UID - it looks at the
> credentials of the task for purposes of acting on it as an object, but th=
en
> accesses the effective UID (which the credentials.7 man page describes as
> "[...] used by the kernel to determine the permissions that the process
> will have when accessing shared resources [...]").
>
> For context:
> Arguably, binder's use of task_euid() is a theoretical security problem,
> which only has no impact on Android because Android has no setuid binarie=
s
> executable by apps.

If there's no setuid binary, then the `task_euid` can also just be replaced=
 with
`task_uid`?

> commit 29bc22ac5e5b ("binder: use euid from cred instead of using task")
> fixed that by removing that only user of task_euid(), but the fix got
> reverted in commit c21a80ca0684 ("binder: fix test regression due to
> sender_euid change") because some Android test started failing.

What exactly is relying on the current behaviour? It'll better to fix that =
and
remove `task_euid` completely as I find "objective effective UID" quite
confusing, even with disclaimer that it shouldn't be used.

Best,
Gary


>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  rust/kernel/task.rs | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 49fad6de0674..33e6d44b9a15 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -223,14 +223,17 @@ pub fn pid(&self) -> Pid {
>          unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
>      }
> =20
> -    /// Returns the UID of the given task.
> +    /// Returns the objective real UID of the given task.
>      #[inline]
>      pub fn uid(&self) -> Kuid {
>          // SAFETY: It's always safe to call `task_uid` on a valid task.
>          Kuid::from_raw(unsafe { bindings::task_uid(self.as_ptr()) })
>      }
> =20
> -    /// Returns the effective UID of the given task.
> +    /// Returns the objective effective UID of the given task.
> +    ///
> +    /// You should probably not be using this; the effective UID is norm=
ally
> +    /// only relevant in subjective credentials.
>      #[inline]
>      pub fn euid(&self) -> Kuid {
>          // SAFETY: It's always safe to call `task_euid` on a valid task.
> @@ -363,7 +366,7 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>  }
> =20
>  impl Kuid {
> -    /// Get the current euid.
> +    /// Get the current subjective euid.
>      #[inline]
>      pub fn current_euid() -> Kuid {
>          // SAFETY: Just an FFI call.
>
> ---
> base-commit: 192c0159402e6bfbe13de6f8379546943297783d
> change-id: 20260212-rust-uid-f1b3a45c8084
>
> -- =20
> Jann Horn <jannh@google.com>

