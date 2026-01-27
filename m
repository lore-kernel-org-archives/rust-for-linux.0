Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020078.outbound.protection.outlook.com [52.101.195.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A5303C86
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528570; cv=fail; b=K1pIwUgnP6GlL1CNcUq57ZPPrjK2a/POcG0VIaooEELaSzUi+InFEKYM+tQo3n7UWag3cezpPSMgJW7jPlgUcAj5B7FmHPu9hDtx1eb8Z1/X35+B1R7oDhWPB1BFe7aZyp7FH6c0ahZUkhH+1M0ed+Igro1HFZ+wzWjAdN1KPuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528570; c=relaxed/simple;
	bh=zf/yYxjMzZfhxdlfry0XvxQl4p5juapnRJmtxEGt328=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pUMtNJQk7R5LGagnMDroDA9afMexmpwkFTWD5F5lOF8PeKO0VYzj8scLEMgjdfSIVrJ1j+uHJirTcAS9/qzOLuH5Q/d/7NNi2x1l4u2ih3EDdt6ABAEaX5gaLw4WG4MfTByz2BSptwYI5n3LWl30odlIVGZ/WBJ2UAGhQQxNSqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OT1snUyh; arc=fail smtp.client-ip=52.101.195.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OT1snUyh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk61hfOhGqo7ldWSltxYk4ivB/o70X8Zi4NnLTr3I9kh7x5CMMqxmE9/yOsLlocMwpqMjeAXSk+bg49aXUA3PgxxAfzZlYVu8N0guuJE3De6AFEQzsGDP6bY5ea6k26iavti8qLZtkgg7G/PKjLzbc92eYLLAStWJ+Hii/Ucgt6JWOqKq0wqUy6nPI6yRz5ibLbG5bjRaMAWViLoZhkEx10vYKOjoT5PGKVGAqiysd1aZCBgbsb3k7UH8ePIji49hEeuIU1ZM40Ws29EZOW/NeUJszMWpwtGNT/2Z7c/kkTu1vohE0sVHdFlPmR1+kUDsl7MZyxx0Xk1Dmz4y1DyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7vgfAZ8zk1sZ3ZT2xfYeziu2i5OwgGdIA0xBM2uj9w=;
 b=rGMPPBghIedSvMNTzVM/mj+8oOdBRbin366Gh65bnnPPLCbVjbsuoQj8UVzBZqKMqTcNmZMPz/jxTpdEuvkxUGECXuoEuUGaBKhpqetZbjLA7K2lSK1AfgcOdYq1PT7w1jx84QLg2OYwY2KEI616T90zJ0ue8aD1I3uVwHH2fwBVi42gTxjMRO1Efs329FwohCARMBc0G6La8VlWFbi8GB+jDcSQ/QBhrucxMLL44dHjC/i38BaU1k46Uw59UEg5tI2fdKlqMJyaLjawMY1HYKmsFr0x3N0R6yG1IytP6QlUFLxjnyXrj0FveDNWaSfte/ajRmd4Y2+IXos6pLlECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7vgfAZ8zk1sZ3ZT2xfYeziu2i5OwgGdIA0xBM2uj9w=;
 b=OT1snUyhivWS8VDqz9k49OUV4oOMZDputwZ1sgvmwuPGBrq55SWUM6pmY8w2RXWDSHcwcb/amVSdygKvU10ybChGvQz5O7Su1QgS5w09grwj1GM5zDuQbQyvhXGXVbJ5wQrZSJydKHHSPxuJJbATwm0vPrKoyxnO5QE40yWUl4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO9P265MB7621.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 15:42:44 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:42:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 15:42:42 +0000
Message-Id: <DFZHIVE89VOW.1MQL8CO9K7SVI@garyguo.net>
Cc: <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
From: "Gary Guo" <gary@garyguo.net>
To: "Boqun Feng" <boqun@kernel.org>, "FUJITA Tomonori" <tomo@aliasing.net>
X-Mailer: aerc 0.21.0
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-2-tomo@aliasing.net>
 <aXjbRq3Npqo7kr26@tardis.local>
In-Reply-To: <aXjbRq3Npqo7kr26@tardis.local>
X-ClientProxiedBy: LO2P265CA0424.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::28) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO9P265MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: b10f7978-a7e2-4b6c-4554-08de5dbab61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WG5JMWZ2K3NiZE1wNkJmNWtFYTNoaUxUSDJoRnY2VkxlZmNLZmFrYUtmZW12?=
 =?utf-8?B?L1pXV3FGUElvQStjcHJsSGFDc1p5SDBIbEZhZ0dyMDBsakFxYnlqa09VUzRI?=
 =?utf-8?B?SEdkSzNVZjF3bDdheXZ2ejhyTWdrOTE2Z0h0WHlRcjk0NW13MzFLd3BBWk1v?=
 =?utf-8?B?dnNaUk9hd3ZZSHJNd3pQTlZNOXc3RVBNY3NESVc1c1RleDdHV3lhV3JiU1N1?=
 =?utf-8?B?R3RhREV0cHdaZG9KU1NjVlBJN0dEdWdXTmdtelp0T2hQZkFvNnRJVGtNeVZU?=
 =?utf-8?B?TCtQV29BNW1GdnprTDJuMXpndVV5SFMxODE4MW00b2VkSEE4aTVnbEVieVUz?=
 =?utf-8?B?djF5YVJTOVlIVTRzMTBkNENXdENaUkJVR0Z4bHNvZjI1dloxd1ZpZjhXNk1B?=
 =?utf-8?B?Z041b05nVllTVkFTZCt1SGRBbTM1bHN1Um1xVGVBQ3lCSnc1RzNKM0g0RUxD?=
 =?utf-8?B?WWRMUXBkbEZiNEViOEJFV2VFTGlDaUVlMEpPRWVQcGZLYk1TU1l5eGliRXVt?=
 =?utf-8?B?cThjdmJTM2k2MWwxaDFsaWM4Zm1TeGxDZE5BMHhZS0J4cS9JMEJUQ0tEZnVP?=
 =?utf-8?B?Wk9QMWVLM3BPaVl2bjdYL1ZkYWlzWDAwZFZtK0VCd1RFanVrdVVpdEpNOW1U?=
 =?utf-8?B?NkR6Q1k2bENZZzkwUXY4U2M0bWVMcmJ6c2NhY1Y4R1RzUjBwcmtKWmRmaGFW?=
 =?utf-8?B?RHJxM3UrOHNUbWVCN0h3c0tJTFBmOEZTMTNuanpPMnFIbDlqdC9iNDYrd0t2?=
 =?utf-8?B?dzZkcVhMcjdTWkowOHZyOVVmV2p0enQ3LzY3V254NWppNUtvOWVNb2Z3dzFQ?=
 =?utf-8?B?aGVDMWZETnU4V3JyUVJxRy9wTVRDTGprd1IrRG5odmo0UFVlNnY4ZXJjSytI?=
 =?utf-8?B?Q3NlUVptbWhUSnY4WXNXQkxuQWJuOHd4S2lhcFRqVTVGNGhnWm1VRGdoaEZZ?=
 =?utf-8?B?OXR6QnV2YklCcldNS0l6R0l2dHE5a3FUK0hBcitKUk1hWVh1S0ZKT1FDTCtU?=
 =?utf-8?B?OXBkR1gzMW54WmhmMU1Od1E3WVhzdGxzMmVvdy9pMlBjbHlxYUhacXo3NlZr?=
 =?utf-8?B?WXRBcXczcnpLTHlmK3MyTDdqcGtGMkQvK0txRG1xUU5Lei9nQWw5ZzdmcUdk?=
 =?utf-8?B?N2NhYlpCRkFmdEw2ME4rYUcySThDMUZ3ZFFJWXJWZHhLSVUwS1l0OU9PaGox?=
 =?utf-8?B?cVo1MlhyTDU5MzFMNVh4MmZMZHIyZEJnVWNOY2F3UmRuUyt2TVYrTStKQUlG?=
 =?utf-8?B?R3JDR0VIQUpJQWh3emhpZTdoQlFJQncrckdHb3FmZUttdW1wV2taUUFXaHNS?=
 =?utf-8?B?Rm1CV0V6N0tYVzRCSjd5YXBlTmdXYW1uQXpyL1NzQ2g2Z1pjQmtuT1VRNzhR?=
 =?utf-8?B?S09kRUlsd2NQK1VCMGpZY3pEVTJ1V0hRbDRoOGlwRDVjMFlEeCsyWTZ5Mjhi?=
 =?utf-8?B?VmMrQkxqWjA0MmwxdURRa2VOQWFIUC9OdkhlUW9SZHpBMHFQK1lkWFpZSmlW?=
 =?utf-8?B?L1BRb1lzM0I2Z0pybVhDWE4yNmR4MWVMeFZtZU9RY0JPOTF5ZVBGRkhnclNS?=
 =?utf-8?B?UU9OalFyeUxoS0pyNzc3b1czdXU2Z1p4d1F3cWZORjVWckRlT0xNWjJ4WDZM?=
 =?utf-8?B?TDdsa1hhSWUwYksrenZDdkJ0QkhBUlRmeGFBREN5b1BlM3RWcXQxT0h4SW9l?=
 =?utf-8?B?K09QVitCWnBad3cvdEUxdWZLSENwYkhkOCtkM1FUVVZDSVZ4QlBTdmVMTVVK?=
 =?utf-8?B?S2puclRMcG02REZjVW5TN3I2blpyVzhleUZablJUY2tWV2d6dHZHaDBYY2Jt?=
 =?utf-8?B?bDVwKzBuZkNZNjIzRXBLRUhKc3J3WlFqdkc4M3cxSUY0eFQ5eGdOOGNxQTJj?=
 =?utf-8?B?SjduWmlJQkNmTU8xd1pzQXJqMGhteGVvLzl1cURqK1RqSWtVaHNmZWVmOTRY?=
 =?utf-8?B?MndOc3dnOVV6eU53Mzc1a3h5bVk5SGhoM0RNZXJGeHQyNWVjZ2hLRWFIaGor?=
 =?utf-8?B?bjJ3bzRFSWF0SnVrb3liWTE2WERtdkQ3M21ZTWZRWjNYZmgrSlo1R1VzeWg5?=
 =?utf-8?B?M3BYRytiUFRYSWJVSm5KcXl5Q1VkMlRZSTA5dE4zcGxOUlFPN085aE5ZM0VL?=
 =?utf-8?Q?IIC0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG5VdGEyb0F5bDNOL05yNmVCV0QxeURVWGx2aVdERnJmWW1PTGp4SGFNWFpa?=
 =?utf-8?B?WXE5eEd5R0p2bjM3N1lvek85ZjhjYXB2R0VYcGpJdjZpSHhmOVhRcDV3WVA2?=
 =?utf-8?B?YVNJTXdEdXVmVEY4blQ5eEkvZkVGcGZDTjJxejN6OUIwU0wzVDZLNGczVFdT?=
 =?utf-8?B?ZjZlOFBwWlVqcUVvSW5WSmRCU2tOM3l5S0lac1Rma2crVWlFQ0VZUWhBYTlh?=
 =?utf-8?B?bEZJaytIVmJEdG1nckVVNWdJOXFtSndCOXZONENUb1hLeUMzOVc5Mm03MFI3?=
 =?utf-8?B?bWNsMGpwUzc4QmxqTk5ndDVVcklpQzNJZUg2NEJLMFhJU0o2TDZQUFNQclU0?=
 =?utf-8?B?T0lJc0RjRXQ0bHYvbXhUdlBIS3JOOS9lM1hHZWxuT1ZEUjdNdk9lK0NDMGRq?=
 =?utf-8?B?R0drZE51aU5LREFiWmFnaW83VGh0em5HVVBCMUJaVGU1ZXVtMlpXbnhGZmk4?=
 =?utf-8?B?bUZMMDRLTTFZNEZGMkNzMkpiaEx0Z1VVSWwvaHBxNHVrWitDQ3ZOcnlCWW1n?=
 =?utf-8?B?M0tlVkgya0xIYmdWOVdvT1lZV0ViRU1vVzlHQXc3dnBuUm13MmNwUjJ1R0pK?=
 =?utf-8?B?bmVEYzJ0WVcxc016Q0Z5VGFPL2lxSkxqOVhzaWpWVHFSS0ErR2FpVHMrZi9I?=
 =?utf-8?B?Qlc5WG9MQXJsb1FiTWJNM3FHRFBDUm05OU1XZGJ4Q3lUL1dEdFZrbS81RG01?=
 =?utf-8?B?VE5vc1YwaUorTmw3UVFtaytNdU1kYkM2Q1NEREc2RlkxelkzZVFvN0d2aG9Z?=
 =?utf-8?B?Si9rRzV0ZVlZK0UzVkdQV2F4T2JBTnI5cDlGR3J6WXoxZFk4emxWQ1Rxb0p4?=
 =?utf-8?B?blMzY0hRQ2N5YUhyVTJUOFkxVDBFU2ZwOTl0WGlCeDkrUlc0NDRKdG1heGpn?=
 =?utf-8?B?OGhFemttM2o4RHV3MEtSTUllN2YrMW1DaVJJOXIrY1lvVzh4UXRjcFJGRWZH?=
 =?utf-8?B?MzVjWGljU3hoV1AwdWExZ1pQZ0M4bTF5UE10bmxDS05NeDVhTlB4RURNNG5r?=
 =?utf-8?B?Z2R0SDdJbldRb2szWk42QWhCRlRtS2wwT3U3WmxINERoKzJIWVg0R1RLaW0x?=
 =?utf-8?B?Z1hQUllqUmEwM2ZVWjhBUHdzOG9TaWhSU3lMSW1YcTZjU0lFMFNLaDVsT2RV?=
 =?utf-8?B?TS9ueW1JVkl3V0RvbVVyd2cyVC8rNUc0MDQyR25sQzV5RXdEUTN0NE9HUXp5?=
 =?utf-8?B?Wk5uOVlMb3JGcHZCRVk4WTZMVm90Rm5BRnpXQUN0bmJnVStwek9QSFZUZTBy?=
 =?utf-8?B?eDk5bXFFZG9Wcy9HdWxoZHVWUUdxUDVQblVUZzhhUE9JWnA3QXpoTVlNemdX?=
 =?utf-8?B?d1dXc2lxNnFEOCtIOWt5dnNUKzNZU0ROMkFmWllyZ01LQnYxamo3QWc0YVZm?=
 =?utf-8?B?bkJndngwRWRVNnZrNzJTMExOMjFBZ2R1eXhMdmtlajZieTZNcGEyeVRSbG5q?=
 =?utf-8?B?VHVmL0VNZTBkUWVVdlQrekpMTjdvK2IyRDJUbXo0clhOTTJDbEN6ekFPMm43?=
 =?utf-8?B?V2ZCY1VnUnFwQXF3R0pTcjduUTBHMUF4U0ZQN1hSUDd0bkJZMllNWWlCLzJP?=
 =?utf-8?B?SXoyQmkxQjcwOTdWQzVhTlUya0tGZ3NYWXNweUo1MHB0S3RucFh1MHFlTGFT?=
 =?utf-8?B?VHFtUGU2akRQOXVKeVNSSWxxSHNGUGtLTkI4ME53NXhNdlRoVFpjSm0wM0kw?=
 =?utf-8?B?MVdBUm9iZEFtejMxM1VSMFRUaTVrM0hCSUhhbXcyVFFzSTB0Unp2QVpjN3pF?=
 =?utf-8?B?aDExV29zQnZON0xZTStxR3B5T2JLbU1hQno4TklnQ1pqcXZzSHNoSkRzT0dh?=
 =?utf-8?B?T0I4REdxa3FvM21CbTA4QzhsT2UrMVV2R1owQ0xLQlV3SW1RbUU3alZFWVFl?=
 =?utf-8?B?enNsZ1JRTWhmc3p3SXM0azk0RmlpUFV3MHIzWTAyNjNyOE03YW5GL1hGdVVG?=
 =?utf-8?B?SVdFL0svN3RkTkxiVkZ2ZTd4aTlzVDhMclVGczJVbU00V2x4SG8zZWlLcHhn?=
 =?utf-8?B?N1pncHZGT3NiR1lrd2JLM2oxZm4vYS9jVnpSSjlUNi95cjJrb0w5RmMwYmEz?=
 =?utf-8?B?OVBRUXYrWnVOUy9EZVhkSklJTCs1SXJIUUIwSHdkQjlIZ1JKQmJzQ1hxbUho?=
 =?utf-8?B?YTRneEhOVVpkNVVMOE04ckdEUUZNcVdkNTJ3Zjl3UjhUMlk0MUxWeGtrUGlK?=
 =?utf-8?B?TzZ0MXIvSEFVeXF6Tk5hU1NyeDV5QU1nSlRXMCtZQkgwdWYwRzZCRHJoSzhK?=
 =?utf-8?B?UlpIaWJ3UW5NN3BDZ1lMT0NrcS8yeCt4dWpKVnJVODdFeFV4THd0OVhDd051?=
 =?utf-8?B?dDFidXNiN3NSdXEybkZPUjFBQ3NMV1FsczZYc1ZTV3ZPcmxYQzhwdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b10f7978-a7e2-4b6c-4554-08de5dbab61f
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:42:44.2930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlkhF9pPv+IkwmI3bgRjNh6BIZRsX6mg9uByWmLE0p9jUbf9+WfY1lpF5OSUVcpqw/TxE12lo9LdgnQGqVqulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7621

On Tue Jan 27, 2026 at 3:35 PM GMT, Boqun Feng wrote:
> [For some unknown reasons, I cannot send my reply via gmail hence reply
>  via kernel.org account, I might switch from gmail later on]
>
> On Tue, Jan 27, 2026 at 09:52:59PM +0900, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>=20
>> AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
>> Atomic<T>::get_mut().
>>=20
>> Also add kunit tests for AtomicFlag.
>>=20
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
>>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
>>  2 files changed, 37 insertions(+)
>>=20
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index 6c46335bdb8c..b6c01d9f3a46 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
>> @@ -591,6 +591,26 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(=
&self, b: bool, o: Ordering)
>>          self.0.store(b.into(), o)
>>      }
>> =20
>> +    /// Returns a mutable reference to the underlying flag as a `bool`.
>> +    ///
>> +    /// This is safe because the mutable reference of the atomic flag g=
uarantees exclusive access.
>> +    pub fn get_mut(&mut self) -> &mut bool {
>> +        let byte_ptr =3D {
>> +            let ptr =3D self.0.as_ptr().cast::<u8>();
>> +            let offset =3D if cfg!(target_endian =3D "big") {
>> +                core::mem::size_of::<Flag>() - 1
>> +            } else {
>> +                0
>> +            };
>
> The idea is solid, but I want to avoid endian handling in the function,
> I would prefer a "struct declaration" solution like:
>
>     #[cfg(target_endian =3D "big")]
>     #[repr(align(4))]
>     pub(super) struct FlagInner {
>         _pad: [i8; 3],
> 	bool_field: bool,
>     }
>
>     #[cfg(target_endian =3D "little")]
>     #[repr(align(4))]
>     struct FlagInner {
> 	bool_field: bool,
>         _pad: [i8; 3],
>     }
>
> redefine `Flag` as `BoolFlag`
>
>     #[repr(i32)]
>     pub enum BoolFlag {
>         Clear =3D 0,
> 	Set =3D 1,
>     }
>
> and `Flag` becomes a union of `BoolFlag` and `FlagInner`:
>
>     /// # Invariants
>     /// `Flag` is either 0 or 1 in a i32 representation which implies
>     /// that `inner` is always valid as long as `_pad` stays 0.
>     pub union Flag {
>         pub(super) inner: FlagInner,
>         pub flag: BoolFlag,
>     }
>
>     // can static_assert that `Flag` and `BoolFlag` has the same
>     // alignement and size.
>
> then
>
>     impl AtomicFlag {
>         pub fn get_mut(&mut self) -> &mut bool {
> 	    let flag =3D self.0.get_mut(); // <- &mut Flag
>
>             // INVARIANTS: flag.inner._pad cannot be modified via the
> 	    // returned reference.
> 	    // SAFETY: Per type invariants, `flag.inner.bool_field` is
> 	    // always a valid bool.
> 	    unsafe { &mut flag.inner.bool_field }
> 	}
>     }
>
> Thoughts?
>
> Regards,
> Boqun

I think we really need special handling for endianness for this one single
function, so doing all the extra stuff feels really unnecessary.

I prefer Fujita's current version.

Best,
Gary

>
>> +
>> +            // SAFETY: `ptr` is valid for `size_of::<Flag>()` bytes; `o=
ffset` selects the LSB.
>> +            unsafe { ptr.add(offset) }
>> +        };
>> +
>> +        // SAFETY: The LSB holds `0`/`1` for `Flag::Clear/Set`, and `bo=
ol` is `i8`-sized/aligned.
>> +        unsafe { &mut *byte_ptr.cast::<bool>() }
>> +    }
>> +
>>      /// Stores a value to the atomic flag and returns the previous valu=
e.
>>      #[inline(always)]
>>      pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Orderi=
ng) -> bool {
>> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/ato=
mic/predefine.rs
>> index 11bc67ab70a3..e413b9e9fe21 100644
>> --- a/rust/kernel/sync/atomic/predefine.rs
>> +++ b/rust/kernel/sync/atomic/predefine.rs
>> @@ -351,6 +351,23 @@ fn atomic_bool_tests() {
>>          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
>>      }
>> =20
>> +    #[test]
>> +    fn atomic_flag_tests() {
>> +        let mut flag =3D AtomicFlag::new(false);
>> +
>> +        assert_eq!(false, flag.load(Relaxed));
>> +
>> +        *flag.get_mut() =3D true;
>> +        assert_eq!(true, flag.load(Relaxed));
>> +
>> +        assert_eq!(true, flag.xchg(false, Relaxed));
>> +        assert_eq!(false, flag.load(Relaxed));
>> +
>> +        *flag.get_mut() =3D true;
>> +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
>> +        assert_eq!(false, flag.load(Relaxed));
>> +    }
>> +
>>      #[test]
>>      fn atomic_ptr_tests() {
>>          let mut v =3D 42;
>> --=20
>> 2.43.0
>>=20

