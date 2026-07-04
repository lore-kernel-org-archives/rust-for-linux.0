Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0602C028F
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 20:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783195440; cv=pass; b=MMmssujh2Wzs8Td3JfvwMuYS+FaY5rLK81ilKTtLL9WHCTOEw2GDej/3Ok0CW9HC2flsR9NjfNwf1w2/R6hWshRG44Px8UUebaTh68S4CVTuwaLOY1tC1JNgRSACs7yIDNPg37muGGQfgIL3pPsYJwWLm2Mh0UOvkkR9Onhx/hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783195440; c=relaxed/simple;
	bh=v5PqFB1Y0oh5ESreAXnamDZHFxXnu8xnSZ7Myi2Y0Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCQFx2AwE+Eu7EzHdA4s+eOoS4wrCqD+cIANh9oOqP6XpIrVG8gwKpjcQrhylbjnbfvOjuglWYJqSOSlZak3cC7GZYGVMZUTK8v9U7tYmPS+Zpit3IF/Nma//Hd1nQwvVHC5RaG9FU9wM8/KBOVjGBK48Uw29zckVvXXOlZsuo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0nAKuNO; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0nAKuNO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7ab2b9dceso3623585ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Jul 2026 13:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783195439; cv=none;
        d=google.com; s=arc-20260327;
        b=Gcac1L+2IuoSFsWctr/eoi4tZwjyoBpdxDWASSAwgOzOtbQEPvv0z208H3Z8THBEYW
         AP66vvjI3i8ae8EDDQCc+6HaCBGuKXc2UMO98EREWI4gow7DvZQjNBs6xmUyofANMOoL
         caR4I0wfbKxkOZFewpJLf15DpDHl8GKXlc0OySVAVHnOybUkna++7APThkNo/IPqxsio
         shBhfpJ5K4jlABCMk2uNOvokdG+23TWzq0dN9lXvbnl4p+i7D1rzBsCnjA+kx+Y1azLQ
         OAIfGKv5xsyEY4qQSFSlsIADzd6pCe6w+g8EAof0ewkC4niJJFrfLWdA+K4CFGbsuYMM
         VhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IBXJ7/+RUGm1s6ccqkZL/lkqHdcUyRDSsk0BOOmv0yU=;
        fh=dkQNeyGXDeTHZHH3DQN1teTVExhguKBybbcSfaBCTB4=;
        b=NCk0D7KpxSiqdG2vIHbJzLgZV0cyIRDPdw6epxkvK0rU496rRcSd1dASEJRDFn+Kkg
         9np2aqZH+Bf2Sa1WiS9kdXrU5CzOM3MTsH4Fu2dqlP6aDRDRGrxlyeU0N2qL71fine25
         q5h8IpgtD0gTaPEzww0cxp7QEdgFqKYjwXMF9S6f/iIH2UZ90th+7m0Abp81OHl/oEoT
         P+jKtME1ZgqfdCbSHKB7P19Z/jZ/jv5AmhkGd0tT69T5xdmGMoK+NYRYOun0hQl0Z3NG
         fQNHXoNd2aJba91icetfOXONBz5CDzbuCckd1f3KH7fmKGof16gCrvwI5bPQFUnbiSh0
         yhoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783195439; x=1783800239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IBXJ7/+RUGm1s6ccqkZL/lkqHdcUyRDSsk0BOOmv0yU=;
        b=g0nAKuNOYFQTOgaNZqyJaVAjNhcMubBVOIbD/qBRRfLcZW7TKYsgi/QiRVZvTMiuWb
         3GV0st63gX8tcuCivUlycnWiYVmh7ZnnsoQZ1rUP0CACv++2+BNxEl0tiwdTaA/pbgaN
         oWOdMX4fjEpaiASksPxCN4kmEC3lEiFJ92yd2LMce8WYXNlwyc1PuvCPMqlojgwl5TJ6
         mO8NI5XNYmP9YzPygg6eHCJYd9DpqcJccwkViac27RHirDVdjpYoPU2SQc7zt4gGEuWM
         znXh9ZJJXPf/bFTqjUWqyHmGT8Oe66dNZYM5z2v04KluhI704CmdL+AEdeVutx8m+n9w
         DZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783195439; x=1783800239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBXJ7/+RUGm1s6ccqkZL/lkqHdcUyRDSsk0BOOmv0yU=;
        b=B9Gw9649lRNIOMx1AhMcElHC2H3u4Xgs3dzVsc9mA0aE42zIhNWczDLvVsc5T4LkX4
         JnlkRGO0CEmOLDH23y1/KI566yfTHGR0FRl0sa60Gr3DX8eCE8hGj1FvDKu11/Qh4gyr
         WO5rUQcaiQDKAYkcM1fHH974oiK3d0Z9+acODREyFXkjzac2a+9/3E4Ip2wktyojJCql
         WAM5YJ9scKhNgPpiEjucC5CJVecwjViMKa1By40YtkaER9768fPHBD/Qhe/H7jBJmg7Y
         2j7IjMjYJ66sZiW8h656XvE9C109mHEUMH1IpCE4bCPTV+agQX8U6txXOml/bssdUXzz
         9s2w==
X-Forwarded-Encrypted: i=1; AHgh+RrzjsDuSE0R208v7078lcQlCpOIKbdx1lBOI8sNGcUC9PJlBwLxsuwHwyvJejgyVCjTmYQf7y/NngiW2UgwUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV5DJKXgxyUOvUcpVN+dF1ZmDu66yEY/3fq95acO7LV3NApXjh
	rHLnXksM9PyrIj6rrguW1sIsPKXVJkdMjJbPf2Km2gjwr6nNipi0GpJok7/ufibp+lGp6XamvyW
	4hBGRws/aAedCBGyaZWrrWAcnQYGtp+I=
X-Gm-Gg: AfdE7cnWsKxHmh7/UmRta3OSSGNFPZsKyglvfJkHnPjpztpuBqMEZIzVwbb3TiF9pZt
	83aPPQdlDkPLlNCQjRfVcySSwvLLpi05Xb+vIRyyg0N4QeBSmYA9f/QqumFDcyk/YSkmDHa4C3U
	RTwpubdD7Nxk137MnI6HIMBfcy+l1U4U7eWZVDkZg18wuvLXRRPNyFg4QpS9NO1GSp/Cz8IhSPx
	St9gy7tXjmMsVRTW3vt+cYEHbpRmOuM01wqcEEMYkl0K4CL+hJZxNfX1Eo5XDWyt/i/vQVmSdkD
	M9B6vbq4R1J/8Q5JIh+q/2NL+dvYbqy9D9xE6TCcQBg++eR40wOmfSp2nC9J7wIuWWmCcRrU1Bf
	juTR2xwu+QXeWaIRG6j2zIsE=
X-Received: by 2002:a17:90a:d406:b0:37f:ea8e:ab79 with SMTP id
 98e67ed59e1d1-382802bea9emr2668947a91.2.1783195438981; Sat, 04 Jul 2026
 13:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204155037.325482-1-marco.crivellari@suse.com>
In-Reply-To: <20260204155037.325482-1-marco.crivellari@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Jul 2026 22:03:42 +0200
X-Gm-Features: AVVi8CcUUSPTNL14m_AbtPIhw7HQ8BruGSVxi6EN1oHwyw-_3RU1tmDpZziaG-A
Message-ID: <CANiq72mmBmdKsXDZuRvcm2_MfjHKzGphdv8_n1FvoV20va4dPA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add new workqueue wrapper and enqueue on cpu functions
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 4:50=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Recently the workqueue code has been changed introducing two new workqueu=
e,
> system_percpu_wq and system_dfl_wq, as a future replacement for system_wq=
 and
> system_unbound_wq respectively.

The C side merged the warning, and now this triggers in on of our doctests:

  workqueue: work func _R...sync_completion_rs_18... enqueued on deprecated
  workqueue. Use system_{percpu|dfl}_wq instead.

Should we move forward with this, then?

(By the way, please run `make ... rustfmt` on the patchset).

Thanks!

Cheers,
Miguel
