Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021108.outbound.protection.outlook.com [52.101.100.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485301A23AC;
	Wed, 18 Feb 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427309; cv=fail; b=uWcLQdQjO1rDc95nYc0lV2RfpX8eUdRALmVC1UIJtcnirEWJge2YiX5bgHI/pi4xMlQSwlD/QIHbw+qs1p+jP5DK0Snz4AtCAoiXByFebEZGRBwAHEzI5n2KycFMW6ywgZi835JSMsK7SVbVu9DiMz6JnhEi/ZAJsNRkHJ0rp/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427309; c=relaxed/simple;
	bh=2G2fhjjkkfL1Ee0J/EQ/aM9UPK0A1RvJFBBGvoGKZhE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=G69NizNl9a6mSzJW1Gbe+vmRIriWo9tCIy/5X5QK5/TF59IKn99j3KjIDdcacTOfp9OQ6fRyKEx5CgAtLAFbueoGNVcKKhuJyjroW+fecPy48o2/fhJGdIkiWOST2drJbE8pyv3NpISZstm6mqRaZkinyNKnbl0vR9Lzqpai3dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=IQxPAjPk; arc=fail smtp.client-ip=52.101.100.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="IQxPAjPk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4RKe/blZyROWlY7qewdVMFcml8UT3I7qWi4NFJmrJqP02Oxiy+WOps5Y8LsfWK/nexMhkAxgwrDRxGx1ytJ0yxTjrYo/+3iipKFIg1vJhYv1gxmf4JPfcZ9bHjmqXh+vQAMxtpPEsgIu3KzJDgIjjr5VdjJHawi9AFAgSgU00nHp02Z2rD3VJJuuHfw4FSvJDcYXsdHCU1rJ3dtmHHM60x9iRLFfjC7ZrAjXw5yXDLMY2bLABdqbMv9GTunw+rOwzrLn3Bo+2VaasOfVQFw9mapmHZou8SczToPGy3B9damXEgUIvAhlm2elW2HHEHmq62VtdaUAICc9ie1jUE8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slYEOylv/Rh9fNveW1tH/rwD3Yn4/javefqUUV/ZCSw=;
 b=FuuS7KGl8DhRKttHtsc1z4XxGS3p0JRMchKH5pU4ZkhJCGPl54tWOVzgNf02rFsXT4aVZkau4Pa5YVk9S1e9ZJKvw8XsNNhsgzIXfCQofA7DnZgDeYawQmqYMz7ESOqpSQ2gk2vpE7fzyh2IwZ17CHqSrhSiWIbiEHU7xgtZnOU5I7Y0sz5GGl5gVvrCxaTFNQbtSG2vmiwWEzWmuYFiUdjnU/nBEc/dSRTCXKz5BaACYNcCTDX0GD4t+DEjXey1Es3UcXGw/OvBINgGhTXRsqgVXcvPAZinwm9C9M+rIIzgVzWRHqW4Y1AKNvKrYhedDdOphJkKtZUU501sZOCyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slYEOylv/Rh9fNveW1tH/rwD3Yn4/javefqUUV/ZCSw=;
 b=IQxPAjPk4E9IP+9TxpKrFyYD/Pzb7BEg9FJdhkDP3H6agRz5pvhu7uLGrhOP3Og0e6pHXDPqnX0LkI6B2I3cT0e1xJshNkcDZPiC0gBsaz8roM1HIEq4Y0X4ZS+bA2YmUOKidxMbh0Ahl4WrK4bLwAzaEk3p9RzrYSgFV9cneEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7027.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 15:08:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 15:08:18 +0000
Date: Wed, 18 Feb 2026 15:08:17 +0000
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens
 <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
In-Reply-To: <DGGCEMEX10HB.3AZIOF9M54YVR@kernel.org>
References: <20260215132232.1549861-1-lossin@kernel.org>
 <5f29715dba04c5a66195a962ffd1fb69@garyguo.net>
 <DGGCEMEX10HB.3AZIOF9M54YVR@kernel.org>
Message-ID: <99556c0a6594f7ad9d9399e152d7e759@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: f45151eb-22cf-47b6-8167-08de6eff8c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GwRxuakJ7jNHCx0050Jmba51WRWOGCgFHpT5BQFmTjIjIvrcDFvUPn5RrFEY?=
 =?us-ascii?Q?hEq5o7Yqru39B173Zs5MccrhFVVAO3U4RngQgmlOn52C7kNVLIlNHnB4vHCF?=
 =?us-ascii?Q?hQovCXE3PhScwkbc9PaIW7409aDbWFUHRL4TsUR55r+kYfyADzwXb1QSxXPN?=
 =?us-ascii?Q?7/g4BjGGB/5YeHaOr+Ehg33fUaTVSKS4s/jfzh7FT3pBFIAM6hHzh6q8EUaW?=
 =?us-ascii?Q?vtQDnUsYO2SNlS0suFhdXis6KkXulJqqhbQNAJNT6SR8iWuDIF4km+gt1MGk?=
 =?us-ascii?Q?utJ7aCkyaNWg+eESZrfJUBY++ep9LhQXpW3Q1qOFcEQvOJDmZjGKD28/kTzI?=
 =?us-ascii?Q?uTDxDEI6r7GLeX2AW5eNQplbAVn3mTGHkrHgRe70thInXm+kO5Tw0EGbLzVZ?=
 =?us-ascii?Q?+VYy+I6Hvj720ozB10ehZ6kBsiOHHbulgI8lmaYhkUgBPoq9DnCzt3tTh+AP?=
 =?us-ascii?Q?IYy+NmC/k8WEF/4c1Zk8+VLePVJKE9sucSX1cKVlwWGnfQkGBlQ9AYZKf7yp?=
 =?us-ascii?Q?EqcnVDSlCxvoyEukd8wElmYEdy7kfyQffhJ2M/8PTJhwgOPDY8bLlmHKX8te?=
 =?us-ascii?Q?6qzRpgmzNcV7BtZuTD4PfVHLiAgJL4wLKBgyC6K5Bdd7WeyqR5erTqXuf2hO?=
 =?us-ascii?Q?RtY/vXiSBffEsZt28zKoMj8XBZ/6pf3A8+Hyq3kyss/uWF/GBxeIDmaOT8oO?=
 =?us-ascii?Q?7FM97mLfyPhMvqepj8DMhTD6sEq1+SYQx29b2P0P3JMWr9WdAdp01AbmZyxs?=
 =?us-ascii?Q?zIjTloLG40BHQeEbfE6sko9+1kcBgV2JluvEJIKzqYTJOcAfKZKOnqj0cgHE?=
 =?us-ascii?Q?fj4cAMLb7B7rxke+OJsSNIXnVHIfgeC47QCo5LaE07nLuBF98wis0So3B99N?=
 =?us-ascii?Q?CUA58o/UdlbyfwFt5523AGGqCzbLX6RzklwrtePG5xCWxAFqHCkMCz1sow3J?=
 =?us-ascii?Q?RhaWvjS7W1vwojztGgFsCiXOL0Tx82ONdTVzhdRLfMsIL8OZjbtEZ8Z21rdy?=
 =?us-ascii?Q?ZrYCaCw92bE9+ceamHJJoT1zX2X1mJkjgnDpcYTR45JmRgo7274tAUywzUvq?=
 =?us-ascii?Q?+yN7Y3jquDqRtMr3keB1AG4bVAZbV7M+61VSW2wk68mzDBNMYZJ41RdO13KQ?=
 =?us-ascii?Q?gvYCG1EjFMYLccuU3j0K16BRQLHrdqzlSe7E7J/RrvAdZIOwZHQYGcTwjCo0?=
 =?us-ascii?Q?Iga7UTLxLadTI/7JX6rJHTFSDIzgouCEItvhxHx6V+4vfBFRQU9KaUliYy5N?=
 =?us-ascii?Q?SMRaEvXvlCahqmEW1gQiQG3LtB/A28RhqSn2VkrLmy/x4cvxqqBV6h5DLNAl?=
 =?us-ascii?Q?FfaWukaV8hU68ShwRMNaC4Tgx2WYxLgQs6fUWaCrKLyNHbyN5pHneYXUBwtw?=
 =?us-ascii?Q?S7HwrD/dLyzRhA8MQ9VnuznmrRs7S0tR9g/Lnpf2OuFKUYqScDv/r07B9L0C?=
 =?us-ascii?Q?GizWILWs/6iybmh/lUsQS8V70RfUD3kGWLrp5JH+lRb72ZKoEKGHv2Daw4wd?=
 =?us-ascii?Q?Dy1RUskoG/KNBvdN7XJbDYcWTXMomkpy+Z+EuiwV8KiEmX6rsbTt7+Alfbjv?=
 =?us-ascii?Q?G/u+OCkpaXLu09lzbjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qNgioU5uUe1lp0iU9b+lg4/EmyNNlU5Bt7Yuglp0SW/nQbfNicY7dIMqUL+u?=
 =?us-ascii?Q?KF8ww3iDnQfbDSt108FUNm52hBG76kDRP0P9E2vS5xG+71inqAf0nHaekdZb?=
 =?us-ascii?Q?p/NuoH3oKefDj4Lq3K/W3Ou2Ju2zwQzMnqsrL0wAvhlQSheUMMfNUMi4SVNm?=
 =?us-ascii?Q?SkdcPZ0hqse2HWrqVVd3s42eOF56v6KUd+sLip6CQggkTF/MeOtEklD7iTBA?=
 =?us-ascii?Q?XwOdHSyWYijPe4tQVjA1HbpUJ23VA3b4fHMWmvn7dzyaJI+HjMzvf6pfRj7Y?=
 =?us-ascii?Q?QdyCT6isMy3p7t3uiHXpv9Dtdc5ERmx4TVRiOle/bHeNkdyIecRqLMw+5y3a?=
 =?us-ascii?Q?GEAK17Not9K8fr3xcFuSRABgi2qpLaqT9RD94Mz3oJ6eXuEHIL5JQ+7LTBwa?=
 =?us-ascii?Q?gyRpOcsataow5CFB2qAJ+/HCfwPGrer5dx7b7ViSzQQjbMXoXCG7PXNEFhFp?=
 =?us-ascii?Q?p1hhV9T3wfdVaQ/1a5KRL4YS/qf7c+daY056PKsdoN7MdiZz86rCpYl9lR3a?=
 =?us-ascii?Q?wOtAJWaasZGMLqdgOkR6e/xa7OphbgifsrsDRJ1rDoUUrNYu9DuWANODvQyd?=
 =?us-ascii?Q?2Z689T9T4Nlh472TmL3ZYs0ZAZYu5YpmOyn4hqrLs4ID9YhqGkZPUUdRuOdg?=
 =?us-ascii?Q?1Y8W85C4QubFpQ1DomTVM4HSxaA9ox+djh4r+JicuIXYqLDTmgsd0xswo6ox?=
 =?us-ascii?Q?2h61jtgroW2AvyX442ScXZ+9HXzJaMaKcSL4C1yQoSoA4pgWqYdrgpJ6sQsa?=
 =?us-ascii?Q?U7LZJeVokBgoLH2tvboKZ33iCopPGzAx+ARPcYWDrfBTWDDBQFM/uUcqkaou?=
 =?us-ascii?Q?G6Wz9lbhIY+YRUFpIXh3m2uWEeeIpQcCc2P9UioR+4h03mTkDGoI3X/Oz6YD?=
 =?us-ascii?Q?aGXBZxLGKsbGrCfBKFQ9SwJ9oQNgXukry7vIOj/ziHnxVpo6yRVnj3bvFIZ3?=
 =?us-ascii?Q?4i7WOHmnGD76Ksh0vVv0XDeAIIR4z2z09AsB5ZsRnlgieW1q4WWP9dDnaAJe?=
 =?us-ascii?Q?wHSCAU6GjljdBckKS0RKtO0j2JjWQksUlasHg4GGwOdZPdOjdSgSqd17wiYA?=
 =?us-ascii?Q?f0gcpCQqkC6pwwWeIcN4gL+JspCqsOd0Zsdt3/+XGduAIE6gy7ZdxbNbjyX6?=
 =?us-ascii?Q?AvpFKiwWQ/CbMVeej4eKFfT6uBUyA9WUO0mmeuIsBcnsNpZxlrrCzxX+y0u3?=
 =?us-ascii?Q?F0ruWVRs8awxRbkUNJzGTsGlXSvTDq9923rQ0Yb/ahRrKSV0lOE6kDjTYZ7Q?=
 =?us-ascii?Q?c8uU4tiADpJP9PCdv1qXDZLarjj8A4wzmM5UuN4bqS6GSKbkRJrWtw3T3QkB?=
 =?us-ascii?Q?8UnhMdoZnrFHO8UFWNl84Dt70j2UgjDuoWm6vTcYtKPyo+0sLW91ZuaZh+Rv?=
 =?us-ascii?Q?3HMiW7K/pNQ3Bk0l6wW1h/urRaWFRdiaWHGwePbSd+9NaboRD3WSy5kU3i8h?=
 =?us-ascii?Q?RChWpDYoXL6USrTAl0KLbCJCyR/NazUeyAD0xk/IQUiubbyX1OczFhS/mtZi?=
 =?us-ascii?Q?xFjzTB2EIsg5F0DjS697WJBRNzdPsORIlEjlHOw0ybjE5Q3Z1qSBxc/X3nIF?=
 =?us-ascii?Q?ves3nef0Cu2gn+BMzT2nM5CIxGRrRoG5rVAXLkkhTrHdmqOUbykbxQM96jA5?=
 =?us-ascii?Q?BASCE0OKK/b/TXQbXxka/r/nRfQ1mPHubkHxwyeoleNPpmUTUWoBBgmV4dqR?=
 =?us-ascii?Q?uH7t7WjsqS5T5bOwPuHpxdWaYJwK5JJ71rRJmCM6UZqw+rGPRJ1F36PyHwmu?=
 =?us-ascii?Q?77ZYA/gK3g=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f45151eb-22cf-47b6-8167-08de6eff8c27
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 15:08:18.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAJdyBwK4PAsexaThkRsj+FzxCuIR5K8jyZQdJiRqPoLpsPcP1utCH1gg2DmhQb8otPPejw1zAwYipgzLhUwHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7027

On 2026-02-16 11:17, Benno Lossin wrote:
> On Mon Feb 16, 2026 at 2:36 AM CET, Gary Guo wrote:
>> On 2026-02-15 13:22, Benno Lossin wrote:
>>> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
>>> warns about the `let_and_return` lint when a comment is placed 
>>> between
>>> the let binding and the return expression. Nightly thus fails to 
>>> build,
>>> because the expectation is no longer fulfilled.
>>> 
>>> Thus replace the expectation with an `allow`.
>>> 
>>> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
>>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>> 
>> I think it's worth adding a comment (or reason) that this is no longer 
>> needed after 1.95.
> 
> We'll remove the let binding when we raise the MSRV above 1.78 and then
> the `allow` should also be gone. Do you still want me to add it?
> 
> Cheers,
> Benno

The existing comment just says that the bug exists in 1.78. So is it 
fixed in 1.79+? If so,
please update the comment to say the MSRV that this is no longer needed, 
then I'm fine
without reason for clippy allow.

Best,
Gary
