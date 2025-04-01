Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B913BAF1
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Apr 2025 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514745; cv=none; b=XTqESF7f+8aL/tJKgMd+RR9c831uwUSZu4c4CaWBlq2PrGHqEr6Jw2HdNBlwolSlBqNXtyOdGbIJ0Swo15iCgw74zWkVoaTxIAsM1/4hnPYO51+tfLKPD34HTjjLA47XfutxnJuw1/45K4lA1Z/CKX90OYLzbvD7B80IIhfHivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514745; c=relaxed/simple;
	bh=ofszlQT1ij4224kS39xzL9ruH3CaD0DyNdd1U3SNlLs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UCMV/6b/6P33uPtUdTxvdPeXc9OeeS3cafMij6uZOP5481+RbxATkS+KDhjHaCTMAfmyBh6M24X/WqOuPf18ZIHlU2Uir/7aKXoTiwAi5VrhD1M2WKuJy+4XeAR26xoDTvEYm5JxiSpErUMyi3la6v4GXR6QRaG3EGDXGQ7/7y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Y3hhR3aN; arc=none smtp.client-ip=66.163.186.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Y3hhR3aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743514737; bh=OYr+j/h0p8WSfIy2qZZhOkytnU5ItiVO4YfIuCxZw0s=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=Y3hhR3aNPBqL+M6IMaLH4ZRvu+sh4EBVvq4n7qPjzqa3QpUGBA21dpd6mZ5H320nX2FsvADOO1LnlDrg75IdWEKDKzapMnoVPkSQiR9trNU8+k6BfiCh2PZNjd1hSajWGIDUh8Q9DAT10vh3PYO/yokbroSchlDBRyORw7VNjAj72uqexL5nJCswzs8Yj4kO67HiZPqHsj13hn25fgwfI29cN3bBTgaVM6oI8rCLMS1AGqloMP2pZF+cNqpOvZ1R0gW4iwYKLKW/nmGBXWfvwUD4QgErMy7TsbAUbAx7UaUcbUERzoIbEFz0JWCXmXb7NIdkSA9Lm8z0YXl1BTlEdw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743514737; bh=w34EaG3a7fiXVb02QZb3p34NRpQH48Qms82IrwhFR72=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=eGYwvZSm9gviSfHU7WmOcKx8vDflzXo79HEcT3wxooawO1ZV+MNejFflTk/jkJiAXxJvkYg+81IUZN2NMvZvMU8/ErxkV2qmLbMTepZxmfs18+yZzCPEhL2r8f4ZwkRjXQ7px5hJ4PnU1UT8BrEnx+N2QHjnyj5d6QtUplY7httcs0TttDomt/tQgsK0YKzt7Oymj/deaiy0n+Cx1/vzeneFerJzXlFoZEBwJK3rGoyRjCZ+1gVhjLglDMykw/A8wpuZLlGpp93zUh4HqqYnaATtVMFWZUDM5pPer0iA30i/bDGIZt3NHQh0hiSHxEJUF6IArdSC4tNELkQ2aq83oQ==
X-YMail-OSG: 91LnQWYVM1k8rDaHQaNsvZxs96az6rm9NFw0fPAZGWkQEUw6zbHsPaFeZqGyR2F
 jpN59gThY908AdDwA4zuqp3PiGbBznE8Ql0PC6J.hz8ll7jKt5N.QQ7uYaliyTU.EbdO8MpQEZt9
 mcziZ3igEqs2jBo2z83chDtkhIYBJSg_pbYRrcnZxgLTq7RLYiZ0ZwKD.zMSIqz4vWXBvj.gw6N0
 AWQb.rmCMscLRJD1f_m_X.omR8CIDbpuvrlGxvOU3KVG0XKcp_GmYsHzH.r_FQzomexyeBEVHIsw
 1KirRHAeP_CPi2yrc5D95SCe1HjkM.ONugqI_VJVdgLf0e_G9DRPj__7tG8hZcf5R0hZzjAzEtbF
 JmzcOwH6jy262SU2gjZRPAcutnt7V_6LDQnOtXJMbIkJwu6rLj0w9k1Hy.W9RnuzkP1n6rLeMlzv
 4VM9MmmRFnWd_raCQzZHAe_aYc_KEM7RojHSGP._EG2RU_Jdz0qGyowwzuT1Z0N2ebRtOSvquTV6
 AgK8d07JHaYdbbvNAAcZXC1QA2ZjBYeB2wzhE2z37hSQZC33WKYk4p.upkZx67BR7qsUWxf5p31f
 oDO3W28ud5ruTJCNUTjEqCKgMR36reKkhGgGS0n7vaEkzJ3VUlQFVAwdVMTFTNRTtYNUZHCPYjL8
 VkYwvVOKXK1ZX1LAEPIUHPHpttpMwhwKSyX9nNiyibGhdc.lHrAGy1HUpX6kLe5yI.KRSMzd1Ryq
 iZ2JEZHntQlWz74VY_vlIAJ.duWKRad3aovjMnYU85H9i9BR0ThBTPIedbaVzwutCigh5H4Qh1Yq
 tc.Pz2N_u8v_rQyAxrry4bgwUxjJTwjAmVOxcTFX8ptdGGcFqMJJ3c79XhXxeWSUSGB.XtM4mVAF
 tPgr2PJidAWJ0b8g8UNC8W77IY3GjUM6FeACluXBm1ib8YyxUdWorYPH_GLMvNpOwTJJKY0a3sny
 uNofsEU9dKZDZCdFyagHCekhe7UZ.Oqr9H45.KBKml6fi.T3Otnatet8IWwCEvaT6tu7Wy7SRBlI
 68cnyb6jAGPdGHVezlDBRmcuxEwvQ3JtzK99fwKwiYX5nIimtMDkqfh.Q7O1AHcIIgIWnStuVuO4
 bmr4KKqmQw9z9enBlG9VTUo2PB6bu8ZgZnAZUE2tpyJOnbPt_nq1a5LXGAFdYoNRQ72SxeqEOmuk
 voVadDUHNucgJpDZyKLGdJ.2_iQqlHH4FsEtPiDeBZtYC6ZJ3buQgaJo2L4FqaAm0m8SCdPSyNVK
 6cY1w3BqUQDwP9A_kK7pXAuveG3sD2AIqIIZ4nDwUgWre9OeyKCGHXd4tzWWwCGbnY1nTeedEhco
 X1a3WX0ldgpgAtbVY0.ikUOPd8mY1ZEDHUVzhFzenew4OQyU1tsef0iH_gJVa9ay4F1_s6P7Z1Qr
 O8MGnrjVkJfmVUHupCyOgLNUqbF2JBjqKfHt3k15JvlTjCLwoKchNZmsLDYUu1SagvUAAclAn42p
 2LW8RGY7kyooQ67etprfnVEwRsuo1PlF4X_JxbrVTrFhvH6YAQjuAOp97aA4HIHwqsuf9fkKHqK.
 EiJOPDjxDBKV.0CIwoLBGRgPQjX1l8lMtupJ.8R4jl6DyA5r7OFrhZi.T6VZcUiZiMeO7IrP7pra
 nJKQw8cvRCwD6SQ6SrvhStQyFQvmAlrDq23qzrekpcFO6G4EvCFlokgQvAo.Q_5JDgMlRXkvvzZA
 a8Gcu4KLLZvSE8usmJgeY5.S1WJEvIIGZzQ_SwqChmGZ0KcJbm_AXTb9hkzHBFGl71OaMwAmNoNe
 c7vAEqCJG6rn86QI18BCzb9FdquygwjW8g7eXNze9oWCSJbRdLU_7LYWhHcxpM5cpGTbSX8xX97J
 fmA8eJzcO_e24IPPBvqowUh9PlReUGWGeUkdh4p5gcDBT18w6dLzdjqi0GeGuOtq0.Qxhs19HE7x
 vOONF5TZxWJ6LGDkjPddHqoZsr2vypTzACmqosajzdx4HT8QBMaQmv2wyd9OLcuXEkLxIS3wezCF
 3.HZbISX_Kgs2Jak9Xv2Ckm1LZvgX_JZNlO_8FiIDJ3_MslpNvFOIRiZu4iBPTaF7lVjMOrWsB9Y
 TXasOCtP7yVFQ_OyPYLRD8q0LaKZd7nTkLHKovwu0fyDyGG4k2lQHW1.F0RNp9H7zcp8zA2Jt3mZ
 7A0gR4iss7kyCoCTVDEoo1jSBIuG5RVnqUFh63j9hshwF7_Jp1.fxMuNoJh4ZncsUemgbQnFk_oC
 5id8ElbsycN77zm9dgqiAilwRNBPttQnKBmWdiZoxoYZD
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: 8e63d912-5186-451e-be97-3db38ca25400
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Tue, 1 Apr 2025 13:38:57 +0000
Received: by hermes--production-ir2-54ff696c44-cc2xz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 45ccd3bb692b94e3f4314e563aa58318;
          Tue, 01 Apr 2025 13:38:51 +0000 (UTC)
Message-ID: <0ecc8ec6-eb5d-4589-b3d6-bbddcf75ae91@yahoo.com>
Date: Tue, 1 Apr 2025 14:38:50 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Igor Korotin <igor.korotin@yahoo.com>
Subject: Re: [PATCH] docs: rust: quick-start: update Ubuntu instructions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
 <20250331170118.1376899-1-igor.korotin@yahoo.com>
 <CANiq72ngOZs8idtvxP05k1TK8kcM+Yd7ztSuq1PaAoHHBEQBhQ@mail.gmail.com>
 <44928637.255825.1743501279791@mail.yahoo.com>
 <CANiq72nZsGcDCdE6ddxLg0daLnfuyKWkXzkb+j1PGL0kun+zgg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72nZsGcDCdE6ddxLg0daLnfuyKWkXzkb+j1PGL0kun+zgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.23590 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 4/1/25 12:26, Miguel Ojeda wrote:
> On Tue, Apr 1, 2025 at 11:54 AM Igor Korotin <igor.korotin@yahoo.com> wrote:
>>
>> One of the issues is that bindgen-0.65, by default, uses Ubuntu’s Rust compiler (version 1.75), which is not
>> compatible with the latest kernel sources.
> 
> Hmm... I am not sure what you mean, but `bindgen` does not use the
> Rust compiler. Of course, both are used by the kernel build, but they
> are independent.

Though `bindgen` might not use rust compiler, nonetheless bindgen-0.65
deb package requires rustc in its dependencies:

     root@c4a63fba5ac2:/# apt-cache depends bindgen-0.65
     bindgen-0.65
       Depends: clang-17
       Depends: rustc
         rustc-1.74
       Depends: libc6
       Depends: libgcc-s1

Even if one uses the command:

     apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 
rust-1.80-clippy

It anyway installs both rustc(as default) and rustc-1.80. Can be easily
reproduced in ubuntu:24.04 docker container.


I’ll send a reworked patch for quick-start.rst once it’s ready.

Best Regards
Igor

