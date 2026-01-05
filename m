Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4917BCA;
	Mon,  5 Jan 2026 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625813; cv=fail; b=t7m0DcOpTnd2pY9/aBIMtSczlwtTrjSlLx94i5Le2dUFxBHpgZ9hjATXIHqL1Wnsz6A8wwMouXYn82yrHAq7+AvUqB0IBxmcGYYYRFouI3OoroiZzEY3p7hLMIfb18ofEayyvVs2E3PQV78dU8lXeOlHokn10y0ej+BuSYpn3e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625813; c=relaxed/simple;
	bh=5J5AGjzHIwkGWvgWcFckuntUg3AaIyZtr7360BjfCGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cZKnjuxbQubvqd9POMHIDzai125FwOQSpDGxd24Ja7rA9ybeVZSDi2ZdTRwiOUniNgRMoirzAcZDJwkuuMjzEqF4ntbDrsivQBqIflpxyFfIzoIXyLe0rrzLR6tOzqnaFOLnl6bbKBskN2PU0rCLJWgos7SacIFLol9C3pKSp+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JxsWFnGn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hl43BKrh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JxsWFnGn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hl43BKrh"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Mo23K592162;
	Mon, 5 Jan 2026 15:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=06wyz7wMV4hD5hPP6E
	crZZ17Kw4oWFGb7OU+8gt8sdM=; b=JxsWFnGnWRBoo5ktiE/Z8YOvmuXAlVCrv7
	/AEIhZqHbAHA3EN4YdvHUVx+XE2LHvKV4lFJZ/SUFcMZ+v9HBbynkapimB6moAJ2
	3i2SpN6x3qLoq+GD3wQQ4UeexI1oIfqxJIS1X6GfbJ15Ti0QGJTs4uAVd9KdSHwn
	k3t/zBHNi8YFB5+HUqfSFrl2sz/l3wLG3hB6ZwNJWuF2jX4pi5IVWxdXKwHtLtJ+
	OPCfHU1lv2pWhPNEun7Biuj+EDceibRIo0oOUIiXxj80DvSzCnXBduV3XeV+WpLp
	RU1cRUrKXcP61liFFKAM0LG3VuTfC0PN1HCWNPj/IuL1Le2015bA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bev2jhwmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Jan 2026 15:09:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 605EtcCN026370;
	Mon, 5 Jan 2026 15:09:56 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjhqpb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Jan 2026 15:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBFGPK5qgW0a4Jzzhq2ZV7i1GSkmm7uS6Lmya1tK9mb4pigixKHKlVLZfVw4cyXck3ZjsPva2wG8fJoIV1uGnRG9hFobKEqqjOR6wMY09M9N7KI3wjJpYrqxPq5pYphxsZ2kbqqc9iffDBykf89BxJ4k1IBK+NF4dcvZUNfuRjM+5S8Hu3TSgXhRC9pUgwsIbqVqPGbNHNsB3E73nWdfAA/4CFBc0INfA2Dkb9gM1WSYs74gSlAyMRgcWZuvDFkN07GXhMLVJmwHL05qLkc0G73LTprVSFzQAP4bcPTEg/XMWxVuFbTRlxZ5MAyc9B/B9Ez6M9itEn0E/YX2Elkxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06wyz7wMV4hD5hPP6EcrZZ17Kw4oWFGb7OU+8gt8sdM=;
 b=pw2STy5EABtFNnEjlSX/jH5LKrp/ZPr0w00agfiOrXvyTnma/kih3w9uebXT/HkGfkdm/FGO4ZrYuEFuqIJUat+Vol3zDpJIppfLskiCZMFjaDb5V/IVVPwpwQumHP3oeBIJK1KPL4tPaU0JulRYcw8PU3dbBYd2REvoG1zwLEDI6AspGX+jN/sGe5WErciGJwLHbaseZi7aLrOlVG8v3ZbcGa2PEJJasvZpl8CW3GjLieixcDitjxlIWLv6k6Dc4lDcd7APX4jZQCSgOlmxEsvJhWGYGRuqFgkcLs6EIzI3IhbZIRXeGQrf9R9X5rYG/bhdVg/l5tQ1IQs72bGKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06wyz7wMV4hD5hPP6EcrZZ17Kw4oWFGb7OU+8gt8sdM=;
 b=hl43BKrhSF1QU8Fi+R+u2rYL3VdsaW8Trw0W/OyWnaQtUTcprxNgqZaLNKN7RYiYeySqTyVAvPnhqrQqIN1tvAJOqNJOOhxNd3t9He+oUFi7CyrPd3ugURET35maczh24dEHiAyo6i7tUb8PNLYN5Uv0GxePUfycQ5PA1y/j/CA=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB6628.namprd10.prod.outlook.com (2603:10b6:510:20b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 15:09:51 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 15:09:51 +0000
Date: Mon, 5 Jan 2026 10:09:48 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>,
        Andrew Ballance <andrewjballance@gmail.com>,
        Gary Guo <gary@garyguo.net>, Andrew Morton <akpm@linux-foundation.org>,
        maple-tree@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 10/27] rust: maple_tree: add __rust_helper to helpers
Message-ID: <qwm7lwnardqkxym4nld5vyqk4i3i3va6zuv2uew3ypscealf3u@irzyhge4ygef>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Andrew Morton <akpm@linux-foundation.org>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-10-51da5f454a67@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-define-rust-helper-v2-10-51da5f454a67@google.com>
User-Agent: NeoMutt/20250905
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc79b93-715a-430c-5a58-08de4c6c796c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KNnt92x2iruXtAdRyj4YZhau/XHv49e3AbvPDTKH++2nohiYs17m2Q0dJrtK?=
 =?us-ascii?Q?1MlqdsEWQt8uXhgY0pL0in6mEMZWYrAE4C4bZiGNUNL7Xx7p/prafx5wyh/o?=
 =?us-ascii?Q?nf/d1tlOAJU8hgbd6V7TxTJsRpQ4SEhI2tfDighyeWnsVbUkay9uFz7fxZQV?=
 =?us-ascii?Q?ePg8MWidzOwQaGi45zAQ3b9bzjMINP+wQ9tPJzX2w8AS0M5TxvogLVUrlcgC?=
 =?us-ascii?Q?0AxxhXrPUG5/nYOUSCGcptkoiqghzNff1PDsKt6/YHNToBwIVMOyFqv4ytwD?=
 =?us-ascii?Q?vHk/p+M0G/gwnv4K7YDQ93kVjximDQX+yEUIjp+T6zs7JXfZ+6Vz7+WGS9vV?=
 =?us-ascii?Q?QUHa6ENGooRSJbdHR+rBxxJmAWffaSuiB0J6cbH3DMJhcP7710n406evaCZK?=
 =?us-ascii?Q?+bWCU51B2oEufzZbDGvfud0lPJmXQw799iciuUF7oPq8Er+qwgXuDEuWnHTz?=
 =?us-ascii?Q?2YKqNrLvrz5YVdqGOfRbaKGZjBHoqpX3pMEsU7Z3tHYp6IHbYQYBlKpacbdT?=
 =?us-ascii?Q?uFfQpKp53mBzUSGCRt8UM1sclFBIRUKLWI3RFjM8yI0ETiGyl12lg5he+ejs?=
 =?us-ascii?Q?J6sT4zZZhxDC+N13EeTXeqsvyn21bYX/cjcGuQmqYORJ1NWtzNXn17CW80zG?=
 =?us-ascii?Q?pgthHnT/zGdlbSTvLfwRjqlwX+kvE+nJjxtxIbgsjtatdfu4k9jZwGN5QteT?=
 =?us-ascii?Q?tOHxw9EAC/oBd0a0r5D0pYIGP2hhsGvAqqF6rm288gSt3CWIjGUESh+O2anf?=
 =?us-ascii?Q?W65VAO7SQbdPL4PSdBpl/pR+uS01W6Y+trvZ0a/g7u6R6lPyhKGhjGKIPzt6?=
 =?us-ascii?Q?wnLMV3KzY8VzHAHhFnUvPndqPVohNYhmDGOPoWhZcSCrdnbQUxTS8iTqaIa/?=
 =?us-ascii?Q?XWkRyo2Yty2A8gr/+Lbd89OsVCVdMu1800ase2fy8auwwqMs2/TAqVAn4Hf2?=
 =?us-ascii?Q?gkOnx3hxHNYTyQ/1bXOFe/Io0Oy1+J4IQ3DP5ibFZjbXVcUI1Tjy5d+0l3Cp?=
 =?us-ascii?Q?s58XMDRfg52Xm19+oCyhCUxv08cINov9Bmj5CVQq9DtOMa95LKDAPStxVh1o?=
 =?us-ascii?Q?WAMmrn8QxNsjMTvWmtdCOwdncpVyla4pAWNS1szqiHyH5ojnivU9KQWKHG7n?=
 =?us-ascii?Q?QRuMYg2NctFoO9SY1lwW14j4qVUeVjq0a7MLFjt1lH1w2eLR0tcIbf7MM8BK?=
 =?us-ascii?Q?nYDFlXGebH6BynfDxmnPSx7b7nZuzMlvM3JLsv0yey4ZCD+a+G4hrAVdG3ed?=
 =?us-ascii?Q?8hw2dTcUATDCAAlVWDx+MrIseZM4TRMNKkhvw6Wt2QVWub1Vh82QaqU5Flji?=
 =?us-ascii?Q?linqzaHi9Q0AONDmcm3Xd5AJarnGs7+Vxi8AmhE9ht5mFgHXfgRGKxUQsUY5?=
 =?us-ascii?Q?+oKWqvE/INv96MWZ1FARWrIg+u0PqB8uQAyyErvssVRTjBOP9g0ET5NP0fqp?=
 =?us-ascii?Q?O0vwWs0WGRbM6qiH33I19NLrgnIQmiGw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lwp3Cj/VlLIVZmjSvZESrkHGRF3qyOYHiRx1c7gg6ky29UYaEgJLsvcdNehc?=
 =?us-ascii?Q?u7dXfMk+XYKqrTGk3zwoilolwVhjN0OURSJBBiQ/7fGaeUNWZ1jph8KXytB4?=
 =?us-ascii?Q?RX+6MND68u125+kRjVyOC+svWESGULzyAtt7I1SCNC/ryRvkslbYLzqnEwYB?=
 =?us-ascii?Q?eAgY1nyhxt7+0tzBo6hXQeCmVcdALFps3ePckrWXP8qIVwZx3JZK9w9sUx4A?=
 =?us-ascii?Q?5aLYjAx6v4PAVCrmNe7n2y28PuP8nxPW7fieuKIfIb5Nl89M5LnSKSGenxzq?=
 =?us-ascii?Q?mAYM6yzLmqzNRo8iMjQ6U98AN2nPhsO6t+DBodn+gGgYwk9p92C3FsVx98NP?=
 =?us-ascii?Q?/yoN5XwtyPl2ZKFQ2fe3uXGhzKt7DwEhrIthssmkhH9CNQ6wehQg2lWQI/oQ?=
 =?us-ascii?Q?esb1L0QWZxtj5GvQqM2NeWltWdZrfAQJR7o69LiWeLLN6FZlil5rUFbzgR3e?=
 =?us-ascii?Q?adxTxoK0Cp1kmN6D4sq0i6MisUrd2gTpkLwDTy7GAhcjLGx8uINYvP56tKoN?=
 =?us-ascii?Q?jltydwVeF5vsebzXQI7CvI13cLG9XkTGrh9Ftfx5RvV6Ae8EfzZxStMx16NG?=
 =?us-ascii?Q?86bviLFuQWH+UlYyCop7Yg+2TZQHLOT0WK/J1bd3zk9XvY1THoVq/WHrK1w2?=
 =?us-ascii?Q?/t+k4M2gJgcxZgDFbSJNC8BykpEeeZW0aIKwN3QPIW04j0VBBssHp3Rgu1Gs?=
 =?us-ascii?Q?vPiUkAmGqr4AgUdb8XKDLnP8Cux2FIbfrmxs0U0r8nHJyEQZVbJ3Ij7zVcea?=
 =?us-ascii?Q?abEaPQ9+YSpC3z/cJGxfUJobaOkpefqtLhs+YxSIXJHaAFIOWaaFS1T4p0bm?=
 =?us-ascii?Q?QDLulWk23Id9HfOrEHETmhfYO1Xo6zmAAkmuwmSNaHBQ+LPq7kiw5uRTN7pn?=
 =?us-ascii?Q?1TZzHissabj1+IrA/8TbGYY2Qq1AOzmRdIjtVz5bAZoFkRkEM67FbhVpbwqY?=
 =?us-ascii?Q?Ag1tSYmhUcVCdxfOvdXzm3lsLNHla0bO2MxBHYBoFllKzu2rMiurlsSlqwE3?=
 =?us-ascii?Q?KCo2dy+eSrb2XtgO52rv7vBUW1jIa5qnjMfsJytwHa00RXxflj1xfUN9H70v?=
 =?us-ascii?Q?Qxkd1iyrpSUg4m+EOUsIMsaOkma4hmURNtcDed0iLuuunblkioXdLsSrkVXc?=
 =?us-ascii?Q?gUU2WHNZZzk/2WIAtyi7mNlxsdHucl9WNHPaQE+vms7yPdJNnkuo0RoHQTd+?=
 =?us-ascii?Q?eawsLEOfqHwXbgt+2BobDSXxsElZwyHeTQs6VvqZsmW5mbmc47xMmrmRvQV8?=
 =?us-ascii?Q?+Xtab40WaS3v4iIL4EI+2wIYWguZ190qDfcx4CDblGc7ya5i+CyVSZf+X0tE?=
 =?us-ascii?Q?BRqYcaD7TTgF6ffPlS1ohJZi0vcGA0e3/pL3iAOESZv09DDcCvTMWEoXurIN?=
 =?us-ascii?Q?mxO/7bbfii1C3hZeATCZRjYFFLHKi2W4lKTa2Y6+mDuZ+rH9W/HZIoAkl36N?=
 =?us-ascii?Q?XbiGQN4PqyLTx7DnyxQVt0LYz61m+gxFMcfJRVC1BDHhNRPGKARoULOoVs9C?=
 =?us-ascii?Q?HKkJQOk+rrYg0o4y3iWv4Y+hOIGR6mnrhtSuF2sqU5qp8xSFTEc4ldyWXKES?=
 =?us-ascii?Q?tbMncJFqSNggrdKOjOZR8H79yf2Ka4L7mxMjfE1i9TZimMbGZGL+LZPJeXY9?=
 =?us-ascii?Q?xyAQqWlvt4A5yi4cCgnPkmi3RfOeq11HHWGrKa/K3GH0xn4fyKSqIU2bmRck?=
 =?us-ascii?Q?ycSzI2qfw6czoqjd347qfHFOsSBcLRxIX5VDBlIkEpt3yAtMg0ALGMr7QsXa?=
 =?us-ascii?Q?4FJ7rSHidw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wDsXD2eIsstWPSNYP+45bTIkm8oQomkyKfUwy5kX49ENsMeekptv3CN+4Ih2VPz3Y9uy5dsEFwllBYaThzcow6onCD1oLuQrKlxLVyyFtG4XKfbJ67r2QRw5Tc4PB6n05DYBv6MtfpUjw2PCNdmogesCHQXrX2wt2CvK/F2ImV0sQM2M1tOlY1Q3n0HT8ecyojPA7nsHU1nWaMRg+7+X3wIsGj6rkeSwRVvfirmTfIEiihE9fJEiySApREziaPRWjdzMxlObfkqsg/kEjLuPfhmVhzl0blco3HNT33zNZgAEZafx7Yw173a5ZDpDkyxurf/9kKyGjezmTT2UhKApjqbe4Pr/16dYvrtBIkEAOeki9Q2SMtEorcx1F0aN9LrIzMi/qqjOX8in5LXk2ldnRGOVnpo6hBVQqXZET/1sLoAyp410Q+P/Lz/3pcwIf2iAA2KJPKIi8uxJYa4PzPYCYCw4yFnwKwJZzC4QsZMBkdiGzkuLOLiQMLOgtoEYMwvvdt0D2Cksqj4ZGGS4aA2VmQzPvl7EDCoaFidO9c+iw3mDISYh/XweDUBTCkuKLIpOO9dCfqJ5gL3JlRGdFqMU3nct/EMIjQExsIfHIZvrfEU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc79b93-715a-430c-5a58-08de4c6c796c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 15:09:51.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVJtDCydgcI5JyVjfLddGtD+vX0VI1w1siQ9RyzwHgFbbpR6x9zRTpJjd/eThK7N6CUoxtTlOT7fDON0O6MzTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6628
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601050132
X-Proofpoint-ORIG-GUID: CSrCZRtWt1g3ZDsUY_Y_1XxBMd5L3bhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEzMiBTYWx0ZWRfXyIe2t4gtZRMK
 a03ZJ78jZ6a0EOrkbkc5YBl7UO0Duw07kTYYo2I4XI43+AQqiAb0wrQTAVQ1sqymJvkDN/4UtkW
 cTrhmKJfNZYJeLN3KCL2x6V2N+m6ctmcvpThDlpV62JzV+ChsESrhJea8JWkQaJ2PdEbbFKyTzY
 k58QIxCK6vIN0MpBNbIQs8lo9tR6V0mjbhn2aMRfsMua/bYlirqpf4N7ImGNdrN8wi8QkAVCp/v
 xajL1sq89Q51rjv2SCcO21YMFLlH8UI+5XSwArkdsAMYygnAAXToAh9w+I1Ey8P3u+hQlwKGs+I
 N/ag6xWAu96a13rstTpkzm+VpE/lSRsqu3l6Yqj8FG0Pxawdr4E6ncs0os2V+/zBkzppfpjfYVY
 xyeYE4KQqAda1mFYpecsIHEWYvQ1oWQbJkB3rixdvAxCZjxuIIfLQCNqpd3NIX7mRoXkgzQ4tRX
 rhKtnsmjUdKRc3huZ5P2fN4vRLCYrj2P3e8hdZq0=
X-Authority-Analysis: v=2.4 cv=A9hh/qWG c=1 sm=1 tr=0 ts=695bd445 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=_2yia0w1AAAA:8 a=yPCof4ZbAAAA:8
 a=Z4Rwk6OoAAAA:8 a=JfrnYn6hAAAA:8 a=37rDS-QxAAAA:8 a=RsEYw7Wb8r_WlH3BIDUA:9
 a=CjuIK1q_8ugA:10 a=4yAS8WwzZ1jAEY03B-5r:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:12110
X-Proofpoint-GUID: CSrCZRtWt1g3ZDsUY_Y_1XxBMd5L3bhF

* Alice Ryhl <aliceryhl@google.com> [260105 07:42]:
> This is needed to inline these helpers into Rust code.
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Acked-by: Andrew Ballance <andrewjballance@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Andrew Ballance <andrewjballance@gmail.com>
> Cc: maple-tree@lists.infradead.org
> Cc: linux-mm@kvack.org
> ---
>  rust/helpers/maple_tree.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/helpers/maple_tree.c b/rust/helpers/maple_tree.c
> index 1dd9ac84a13feed53c0ed5eec6805517081d0673..5586486a76e0de60969af1510b4b0428392920e6 100644
> --- a/rust/helpers/maple_tree.c
> +++ b/rust/helpers/maple_tree.c
> @@ -2,7 +2,8 @@
>  
>  #include <linux/maple_tree.h>
>  
> -void rust_helper_mt_init_flags(struct maple_tree *mt, unsigned int flags)
> +__rust_helper void rust_helper_mt_init_flags(struct maple_tree *mt,
> +					     unsigned int flags)
>  {
>  	mt_init_flags(mt, flags);
>  }
> 
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 
