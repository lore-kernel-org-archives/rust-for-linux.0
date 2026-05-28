Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60512352033
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000571; cv=pass; b=DnOxMGUh9XWxQFNz28oK8YN1cu+NFsjgcweSPHYP0oUOnGExHDbkXKmjGhAJWPuXjgCQW1znlJRq9AR893h4HrmapVnPVWaWy5/S7mTVI5j1fPpSXA5eT5D22q0cJNpYyfs37pIK4hUpvl6frm3C1Ci0VaaeEPR7xBA3MBmp/4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000571; c=relaxed/simple;
	bh=xGbNAQvQGEBp3j4ZoRwqmwavkLnKDyFCVPaptBjC8Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jppyi0kiWrznGC3tUGUQdDW37YnGjNqgxg9GOhcq/ixH6jW9tZksyWSaOccg4SSKfIyn6QErVGdrHgaWzEaTt0I0TlossoG/E0KWxePYRtsYUdISbXCaIeoeKaStihJgtraZmOs9GCKOOvRTkqPCywbKiHW8bjOSvJpkWN5BjCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GQoTQsO2; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GQoTQsO2"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68bd7ec2371so161a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 13:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780000569; cv=none;
        d=google.com; s=arc-20240605;
        b=ej8uABwAFN8yJqj+bnVGNxZWkmEiWCnkEAqniy6mJK1UOxmmq2fw5QRXEEJ3BTuw4m
         d+y8sRFrVIPihikk1Uhx9i99xt7gUgzqiU34oHnlTYfgT0Y9YxXig3FVsX2TPjdG40WD
         RC+pQ4zD2DRhPAlObeoOnEESXXRiA52Qloz2FX1cACAWTzHCvTlrST1YrmOLH+UQd1rX
         VS//ISPaGPnFzvKHTL++OG7FyofIMCvYfOg7xwtQBYqrrOlQtL76+roIaU2fTcNICxlk
         tfBR05GK4XaQN/WiUPt2z82kjafoNxJpMvVTHJCkEdeAIrXciZvb9DMLHvvWrUo6MQoB
         rm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xGbNAQvQGEBp3j4ZoRwqmwavkLnKDyFCVPaptBjC8Vg=;
        fh=hbU+Bdy5n1Obo0UTf7OU03HRkGBND4/XQHJFa2zbHPk=;
        b=CbD8QMxzlqqN4wqkHxS2FGTppPMfWGGOQErTcj8Bbl3qZF88+ACl59E4xnMG8FSh5p
         E6v01Pz2NhXd2zZ+qout0zYWpPY3rhTIfBE2yv4jyy3g4OHIGQgtgA2R+S5IR1SzT/yr
         KTdy3wYDekTmGKpr28nCYRVQKfrj2RDntnuBR5X/9NEFleByYNs7nNGXjg7daTodjZnC
         TlqhDjsQAUjLzAWGIL0xscsjbjZfiGrUhIRkywr5xNp6nOqz6nKAmc/5pU7xkp/e9zKp
         SCYdL4jnZagr6FarMTogMoSOvg6BxFD3hQNUVl+t1eZdWrpZhBtEUWs/F/yW/eKk/f9T
         xwLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780000569; x=1780605369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGbNAQvQGEBp3j4ZoRwqmwavkLnKDyFCVPaptBjC8Vg=;
        b=GQoTQsO2ENoe7M/FCOQWl2xMfKamYcdV2s0tPC0xTtK2uNgoBMuksUap3Hs3fGgPeK
         2aPV7Ju2YFMPXlHigfhgHJHOaofTmg1lkT4UKK8g52Y2eIvLnbSdumwU075BklUeJlEH
         PKkRlZil/CRfkjKylUyHzky7Fm5Dp7K8rJitFfkSlU34Zo5VsNQW95/OIC7oWGox1BBD
         xijpDeBm5OkqSEEQk+ejHiHciJDRV9iWqFRd01VddlhBV1Y59nQ9MXg/RqbajSfQy9Gj
         Oz432svHu2kCZPo232GPc1wazgpeSipn5U3NY+1VEpm66CsMRHgxb6G2LKuQRlFizQaV
         bYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000569; x=1780605369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGbNAQvQGEBp3j4ZoRwqmwavkLnKDyFCVPaptBjC8Vg=;
        b=IW2UrCSzTeoxUKSI7DZkvKojbjIQtThDlB5pwTZ56gtBfT4PthBOKLeqDbTO88etO5
         tLTrBDdkI3ihvS7uCFErCXzQcIK+LiSs2WplYmW08u15T3G8/f/LUlkld+ed77RfN0cH
         tzji1vuBcGpbu/Z/bg7wpq/iLhzWFbfSDPTjtQqH9UL0CfbNfZojiqngejFv/jItLqkz
         KuOY1amvn75WQiL59wIBmKc5rEapYDE+hlQpQhnihTG0uveHsgKmPd9AMtTr2wXKBE49
         AYIlNJr8FVx5yxGxjgEJSw0DE08XPCLTqx5wdVfma6r0pnEXHneh+98OsI8dV+1/ATXB
         JibQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hur/tHNWs/kKV/saFr+sfF+8A8WGWZWC9RgmfNAHF5azSK6MaC3CM1t0gkOvUI6byjkk2uCntkt9/VNDnVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDp5RUdURxylYYcDDg2CdwO6+vVQGBemqluBhsMjgUNLsQ/7CU
	PFCxPYPKjKEKIc8MQQlx0vmyhWQvfJtpGk3lI8CAicQ8aLfU1PsT9qi8ArWLZ+UcG0WnHf/Nlzo
	iZMsCims07kfRr1fLNpR/6JUV7tI0zyYxnzQ9Z2HJ
X-Gm-Gg: Acq92OE4m4W7BSj/R52KiqWJFIILuw4dIkH9M6Wfgha4R3JbvUQ3pkrfu/22ddrE4Pw
	qTxh1yfYPYfyRuIBUKqnPUoZ6diAioYGhwYVuIYoi4Lu0qt1GpDxotBbB7yfSbq6heRK/kEG94t
	zUa8Z5xi4VSTVQSbE+rmzuVzjIQ53ozU0IaGE1A5LGDSvy5BxeXukSTA+7bhoh4jnE2B97ZsmZS
	H01oUU/CqTK5kQsSLQGNPwkORkYAhXxoM5ArjGX3VK63YLOaFMylaU0JUxarsX/IVEJIO/x10cr
	X9uMXwdLlvPerkffO0vqTJfaSQ==
X-Received: by 2002:aa7:c590:0:b0:678:a5c3:4d12 with SMTP id
 4fb4d7f45d1cf-68c05b1601emr3372a12.3.1780000568252; Thu, 28 May 2026 13:36:08
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521161405.64042-1-SisyphusCode0311@gmail.com> <CANiq72m5GZp_p2HCgotBaevLmt1NrvzwrzJJK5sLUEwxeVLBdw@mail.gmail.com>
In-Reply-To: <CANiq72m5GZp_p2HCgotBaevLmt1NrvzwrzJJK5sLUEwxeVLBdw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 28 May 2026 13:35:31 -0700
X-Gm-Features: AVHnY4JqqQSqq5hJ5hUwjgysthQNtz3safYPsw-EMSJJRsw6KfF-J8w6KfKFVPk
Message-ID: <CABCJKue2BvckpFK1yROmOcsrRpxRC9m0OiwCymxF=OW0JZkLUw@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: add missing newline to pr_warn
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kenny Glowner <sisyphuscode0311@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 1:56=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, May 21, 2026 at 6:14=E2=80=AFPM Kenny Glowner
> <sisyphuscode0311@gmail.com> wrote:
> >
> > Add a trailing newline ('\n') to the pr_warn! call in set_param to
> > ensure the kernel ring buffer flushes the message correctly and
> > prevents log line smearing.
>
> Did you see log smearing? IIRC this changed with the buffer rework --
> it is still the convention we expect, though, so the diff contents are
> good.
>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1139
> >
> > Signed-off-by: Kenny Glowner <SisyphusCode0311@gmail.com>
>
> Andreas, Sami, Daniel, Luis, Petr: will this one go through modules
> too? Otherwise, please let me know and I can take it.

Yes, I'll take this one through modules too. Thanks, Miguel.

Sami
