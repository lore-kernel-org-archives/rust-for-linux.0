Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3E1AB52D
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740770905; cv=none; b=HwG9zm1lz2rCk86i7s6YLyHARessTntokWlCwoW2gbvD19HKO6WJ8vNkC8nld4AwqtdA37qOWtdKo8aPcafL0iUxGFCVU0PX26bhlRhUlrV48WnSMYOqp/3j+ulIHNQRJW6gCTBD91x9QKN33Vl52Ja06lTOT3Ucb1gBN9iOQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740770905; c=relaxed/simple;
	bh=iHz2Zx+6vxSsJsLU+2K6h4Mq/HcxIkwRv8Ovqqhd5QY=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=dyzMBQVcWr2CmPvbRtArabpOLAy9GWOEL51bjAPGP5Z5JikpJCm5uFDPa1Yf2Zqw9m1ITE36eefPpdROuXBH7YLl2P7B9eCJq2f8UDoiCpjY/dTGbhi9aqsL0NUjEwJQMZz+M9sw7bmeVlP9zl/rzRjhY3SB/dArZI3DsE9PenI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=tg2Tosij; arc=none smtp.client-ip=66.163.191.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="tg2Tosij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740770903; bh=iHz2Zx+6vxSsJsLU+2K6h4Mq/HcxIkwRv8Ovqqhd5QY=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=tg2TosijDEAYYXck850k664b6MBXPqpl2/crrCjw3JPxVF0z+QrlS+sGjoMZ1bRYJKWm8QgectVvrfAWj6U+Za6ES8pDltPxYs/uMNcxogEvSeSOV1jyc8ueqArz2Cw9t/wMsQ2pN3YUyHFjGhuyRNJbhrMK1c6je+yHgHxQ8KR47bUkbo7BZwVFxfr5f0Ct95uL8FoACH+DQIjaQ/IQs1MCBYRx8JoaGZtgjQvCQP/kgtPo5NZ4naJTv67N9tUUKe44y86QeXIuYtFcFLxLlNC7qF3xCaPvq6Zlop0VnF0e6hjpwzrcm6ua+FOG4Hb9g98pG64+s6XBDz4k9iex3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740770903; bh=/nVUC3Bmf0J+E/xEK0Q9UTMYxLIR26tp38FjaMbxMRn=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=hubB/OJdPKFMrJx3ldlqhOf5nO/s7n8QBWY8oNBny/Prh6mePyysZ+Q+njjES1NngZ8Pzvd8XoGbBHZXLWxNqxunTcAu846mGNmzmQHHu3KveXa+DfURb8vvjXfzlYVp0scN9DVOyAACXoaE6JY21cIzfZ82h0ycb/M/rZ2qqf48UqAgxCZQ6GryRzdp9pE4xttj7YofOUSCUAI7bHEOv/pnNFhGusXNBN9TNibNKKxc2D3y2s8jIqwoRlpQdwUx6AYBaK3LHBfbWoFlCBtn5Y3XzBntBLmbG5v6Ud1as8PBCnu6exof3UIzaVgb8rWmaNwUUO9s3M8lle67Fxyj4w==
X-YMail-OSG: 2BRXxcQVM1laFaKELjE9cLXkmFKMuBv.5Vak3LpmCglNcQp5qpxBTLFeeu.SE1O
 JeIfMr7Tp_e9ne08_4.dG7._aKLpz7toJzVER4Pu_ZaQmsCreZMyqPHtAItNIzfWgS3faYNYvTof
 ZTWQVOwe9B.nBd5Gj6YXsRlOqwzq2kN_r8xth6IZBaMJTW.fDyPw2.xoEDptyyZw7io1lZYXHTg9
 fZHYoLEarj1D6g_FWXn6P8pCBC.72JZX.wd8O6Nq5MSrvF373cWabmCSvriy9R1OpSWWmBd5gLKq
 ndg14F5RtfAnY5cNXVOrYYMRcEpt9d6hg4eOAuL65rZamEFrPmmuOTeaY8Uyi2IkbglqLDKsmU8e
 4dzSoTDiEEwf5NmYDyBMOL1y0Fnqn1J.3rL7AynT_Z8oCoGrjIuOj.XCz_QEgDgggACP_uJyd_0o
 OUA2YjZri.FeNdOii7wr1qNFlVKObhjlyeCMkACpDASRPcIpavnQG_MXUlLoS6o3wEnQPA4R4egv
 nebTVVKXZx.tJr23AohRPd5Ipse_lEeeHMEhfNLQiB.stwzxaq1lOFfneO2_pyat5qm01QHqe.9q
 OCWv.afIcM93JSfRcbvdUTujqo9n5W_B6xNJ9552Zbmp6lrSoz0C5yTjvsr1ul1q5jNI0kpnXKl9
 BwQXQyv6qQQ6PCY0GhisreIEoLR8OJdjS3Qg.UDM2Btgwr0KoPs5_vKtHwYuYAXkXa7MDFCNE4b1
 w_cM.lV_KjtvY4l8Ds.LoHWT3zDGiUL5_cDr98U1Cvc58Ui9fvP7g0T9qgifUNRGTpGAnjuDS3tQ
 KarnzevrI._5cIqqiKjyjoez8F2LrGU3s47S.FqlRpeuhKwF4h2Ow89ZCIKGl0Ui6mrJ12PqAGJN
 7GyPRRC0KJ4TpufyGJLGV2_U1NJo92GquOt_DOX7a0YiRlpzxTUJPOaIkS5kRfeudXKzAOLAtMm8
 BZ27iR8YWXTZq5Gl0XKxVmCDfIB13.BqzWEHdGVYU4gtBbZHXW3ZhQNp6x_1gQHmw86FeHYSKBo.
 P0noTW8rXkL6dYSZYm9s4a.kgLzZ5V5YAHHoU1czOFxW33X1twdZYaqgNnID.U8UZ3ERf6XXGPMV
 ufG780JKJmFqcR5Nm5FnAT_8GvDcQ9j5YYQY8q5_9MIZ9qWt.aK4NBZsAnS6H1QAYbY37X5ZsXTq
 crpPDXnAOht.E9hoAfRbZTBo8nCAjiKq6c7BFgm7p355xBrKIG6M.ijS2M1Hy5Lnq5sCEMwtSUGY
 83T_hRZTqmaVLOdBq_TbTRTNUY2XM56kYDHQTuvjddj_wHoVaZgdla1dPgGXrxoT0wa2VP88JIoK
 MG.IdOoRRxXpAiUBFizWu93cgHh.60e1lnZbqIwQHh6GBT5o5VSuZjYf5BeN1BfYwvGKTVIgVfy8
 49LCXYuH7dq5K.XdfR4i66v2mkkguZGWZbLROzjTP0rKmCiPIX0Y_MalVvaG5_ge8eud7WtyXw4r
 NM_2LgVRMZmDa4dQhw6FoYlXksKSt4iE.5uawFeD_My27yw.fDn56eDvqhso.d_kdy1MNtOwoIJt
 HrhJArluX2z5GbynRe3aVhNhfz5ktR_la8BOCklMBO7ECGRYR2.vE_hbqey6eGLUnFcYDhX22cCM
 5hhm6Yg1yiKppF0I9Cc7kqsOoQ54MpkDFsCm_IxA1dSrA4tceh0I6uYt6FgdwI6y5iU_V_AVRKCh
 Pcibi4aBIIVHpFIOvHHgGONwnyBGxG55QlSTKfSnu6ODkRkijAcaZWcHV8XXsY4hUS9JKp4VtUZX
 JmMhmXS9QzEirrK3PushXWP4mfkM3.3NOtZvnZBwJc9bREg2LW4RMHGjnjLRzOLkSokPYRm7NxNk
 k_IgadXrU7f5rxUM9XFGvc9eBNMKzpU7vcPsXh5OLlVOU8UH.s0vvxOz_6BKsFjzSZ8jouRFVNM8
 57uCU3TmU1ATTU0vej.mQaIKd1L1OUg2rnAN1lpKlsylSSZXENK1cfm9qQQ66j6OUVgFahD90OFu
 MT7ZAVfrdhp4gMi3tTuszuSlpzI9kOLA1tDvY1QrfR_j2OGGA.pafCeYmyifw486C2o90d5l62NA
 3.fmPQRWofJ3tiEFcCMBRzVhGkGGLieyMMB_bcZB83sgSolkW0ywu43cdgELzTVwMbg0dJd1RbCP
 k1f1jkyl2OnnAnRW0vDFDoPUh2CNN4P17Usn51EvicR88gm1PVfC5hVb6t2sshkYiITTLIB_0204
 iWrLno4dbBW1qrfm9AgxQhO7rLuc-
X-Sonic-MF: <benjaminxyz@yahoo.com>
X-Sonic-ID: 5699bdaf-04aa-4bfe-8380-0df5e7a5e4fd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Fri, 28 Feb 2025 19:28:23 +0000
Date: Fri, 28 Feb 2025 19:18:13 +0000 (UTC)
From: "benjaminxyz@yahoo.com" <benjaminxyz@yahoo.com>
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Message-ID: <654427719.5861140.1740770293271@mail.yahoo.com>
Subject: sub
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <654427719.5861140.1740770293271.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23369 YMailNovation

sub
