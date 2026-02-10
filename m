Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ECF2DB7A8
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717230; cv=pass; b=MvpRQkT1xNKlNi7KjDxtpZ1J8JebZIrcDz3weBdgGe5j9oruUbZ0kBZdo+9WQZBi8Q4RBwTGle61dMVnQrMMeULKyXjk0utT+ycVdHNrCzKclkpLF2CD47FcsXkoWb+8elmiN+dRpgw15BmC0Zv61Oi+OWNuucHZiOFENJtEwpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717230; c=relaxed/simple;
	bh=N8Ghhb22gM6G+BBjUIo+VQvUWs/IXQhBKkMnRrxr9u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7LdwJvyTJ1KP2GVoDNupR2heV2YXdjGwLiq7ZuoY+DqItXWGs1dDxbsxISYMRNeh1WvsIQNNUDPPVQVQnwbQiq6qH/W5OHk2GkrlGaUdUMIbkEzkAsyJ089C5BKLoIMtwHJazrxrJKQoBvIkIxk/tqsgbfdz71xSKHuLqX9wJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEnUGnby; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEnUGnby"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba9324f461so2608eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 01:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717229; cv=none;
        d=google.com; s=arc-20240605;
        b=D4d7pHZ6xDdigJ0D/I0uGWsQ/omz3H+MsGi2eMVLUfSCnSCB5fMU4hcT/mZ8BsrUMt
         XeJzYqcOLs7Mi/oSLV+bOmboo4gpMGBk0F6891gdZHSYnJlgnyw4bkIVWOL0g12XRRtO
         Cxa5bY1M6eCWoLLC8lMcnff5hD6PFnf1dX3g+Pr02sh7Baf6+1faWeKPrZEkXeE1OUo4
         ATyh7Pn7mOzNiOIXc9RhNfRWQ3xbqR3C6Q3otH59eDHdkVTONy/K2KVoYgea17c7PBqn
         BhThcQlVvL4HdMfx2W2aCqQIzvU12gxRbHpewwFMJfLuXBxUksRBgtF8gb3XXmGuJYsa
         i7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        fh=dkCNWDznZpzdIDpfKA91yEPLyLL131ysW1gBUHavZYI=;
        b=jLRXVWyvuMZxwGkJORuMhU/obizYoa4D55SLHfCMYzwAra9h0RiDThi5jqMxza5QZX
         o+4iKSk9OibAP6Ft6pk9upCfndMho/Pg5p5/coMlnqMuBPZNuREhP9gEcqPVhYIQDWdB
         ouUPHqWxCXHoSwNbYgMEUxNZULo6R3McY4OxRUWIyZoBiER/ChnxwpB2VTc/tLDjBhvM
         Y/jWvsRtM5H9TiTFCPDaRGfjrZPPtATj+FIZ1QrVwtxDbXUqd7PJ/zGtZmlezkxFHfbt
         r0b10N07gIBPvIXao475RzxCAWdJSFGXMOJ/6Np50bwAOWyFUyUZfyyPyQjtcjcEfOLq
         ZYkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770717229; x=1771322029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        b=cEnUGnby7F+AMXhL1riyBkAvQkCT6SmqJ13GL8wTdQCNXUXnzx05ZpblyUDQct4JvT
         bZoXw3KENLfOCh5AVsPLalsqXFMgornsZF95o860zUAGrthJx1n4QHtMWcnjP9SiymiN
         11oa6EIyQp/8ReikamO2r6Robs7XLhn9A9nzRbp2wng5J4oM3+/SPde5WvUeT9YnZ99P
         c/0TbdM4HVEfFOvJQL9iT19DI6XGje6vgUYDiVc/7gCX7QmF7OrrN9r33zO5sWiDOTWG
         f+camrMysYcDgP80BiL3G3LxL2GMousxI7/28EpOa0PX9PiOMMCLAktviJWY61jYnOW0
         Sm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717229; x=1771322029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        b=mwFmeBgm0jlnBdAAg4Xwkk2d+jG3NU3JJzNf+WcDyR/a8XlMMXaa+Lb1RDAOBaFTH/
         CquOUmN7PpBmKAyOUg0aMHGyUy3Dx4IiyokseslPvLqstHM8iDKl8YywRo+E9PEZzRFh
         7F6hbzG2/tUNH3s50rBYZ8n1rzHqlqZTuh43VhOjhktLU5domYppwE+0XzUtULqTwet9
         qS4ldxHEcMt04FVfYRR3smathJo3HY8coKMH9RkTbbqXjLRuUos0+tAyN56UyS2BLz4A
         rTBHbiA6lPwH1Xg3GXYFlmW8iwut81F9Jyxxe/XNKjb3w9UndXT7eCw7xFV9W8WpnqDL
         WFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyebX6Xc0WawnJD4gmUSrGyxbs6qGN9fo+3OQceUQeYEZpvrmdL4G2UUteHsKx3isH6NCXKT5lHY6kszQQ0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhv4J00Eslx6EH82xwe5NePC2kuv5625OU3/roh2G1oxk8Jp75
	tUgbOY/eZGwoFP+8ByB6zRh78f9Io7RIGdRG/dDj8f7MctRCMwySwDma68cRf1sFpytlPeu6K7Y
	pg/uch7cl/W05gRPqyM727eKt9AkttvY=
X-Gm-Gg: AZuq6aIVGS5hp7vIAZzWhzICnBJydIiw/SpzC/DQpOIH7mJ0HrRP96RKDG+BDkv2/AD
	2ZRyT+uPvEzJqCV9ONI33kkaLZnWigEB7/uHJ+0AIieqLqLUhFRmYLKO3YpZrEjax20rKQsDgyS
	b6CYbrjXDQCjlOm7qVkHJH4ItLykZnoOtYFn/C1AwtaZ22TlknBPU0YsKS5ivqfx89zUZYqrdWO
	3evhGonBjNrPrD8k61WnlSwFVngYQlflTdCAlDKx70PI9TKf7VGrW5LFnPH1mV1O5/WFMy4veOZ
	Vflh2/Q3dTolUlvuSXAqTpHEyX+ZjOFBlG/Bo088Y+yGm3oQIQs0zXhb43Q9eX/cv6vnf6Nktz/
	EpYJXbtHUTBUvnqYP3a0kI075
X-Received: by 2002:a05:7300:d506:b0:2ba:674a:dbe8 with SMTP id
 5a478bee46e88-2ba8cdbea18mr186901eec.8.1770717228681; Tue, 10 Feb 2026
 01:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org> <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
 <aYr9c90CWAXZ3AVl@luna>
In-Reply-To: <aYr9c90CWAXZ3AVl@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 10:53:36 +0100
X-Gm-Features: AZwV_Qj-Kgu9bLoO-gKQAEhUKyeEsXtfDicIFD8WGPBwV1O8UBQ_YNqmy8D86Ug
Message-ID: <CANiq72nrmaczPQQrf6xjQrT4j_TVghE2k3CrwJRs=R1tZgiR5A@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:42=E2=80=AFAM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> I=E2=80=99m just an unemployed contributor, with no ties to any of that b=
ut
> sheer interest, would it be ok for me to join that call as well?  I am
> interested in resolving that issue in core, only three types have that
> issue and only in their formatting code so far.

Sure, invited -- and thanks for wanting to solve it! (I asked Mukesh
due to the IBM affiliation -- I didn't mean to exclude you, sorry).

Regarding the issue in `core`, for context: if the solution involves
adding `cfg`s, then we will need to discuss how to approach that,
because years ago we wanted to add some to cut down things we did not
need and they preferred to avoid to keep adding more conditional
compilation, so we only got the `no_fp_fmt_parse` (ec7292ad3c35
("core: add unstable `no_fp_fmt_parse` to disable float fmt/parse
code")). At some points in the past we discussed a targeted
`cfg(linux_kernel)` one (instead of several different ones) to avoid
that.

Cheers,
Miguel
