Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB230DD25
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 20:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546427; cv=none; b=Kyr1m5yDwIXgJNLXNCsqhFlrmBMGpdpngUeh1IuEBT5g1+sUjwhymB0PN15DLmj72ptkBeat7e2xUhpnA+RyJF+4GYNlDGn7S2zOmMiGNrOyCbMHwmmPjZxWkui0TSXy50YOM5J+jo6eHlR5nHTUuxoROEgCJjj44TBaTI46ir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546427; c=relaxed/simple;
	bh=09eUTTlY2G0jdVjelC0cqh/VHK7FqJOXK65qTcB6Hvc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=vGlksm28kOgsGQ5kDlPJKE6E/2ljAXg14JRuNokFBUrmMwVo8SC8ZI45NX6JhAv430e9CttW/iootlLbkIgAcwwK9siu4kwfmgydHe0cG4LpBFn/EQw2FLCajr9/TZmjE0pIiP+0qv3j5oRMpwZgUEsOGMhhUyShNr5liZxF8yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-4330e912c51so4672405ab.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 12:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546424; x=1763151224;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gS1PgCh01Jm1QkTVUHmieEXJsyrh4GhNpZPiTdUvss=;
        b=YMR/XKDnbuZUsFhE/gCsuDKokWT4LGUJEvHsAPZErE98YLJpN8KotVVbdYsuOh5t+8
         Idt3n9eJulI2rCkZiHgykFzVQGQQKceWGCWO4IA88EPZmUY64FZRb14S65Nox5a6ItC0
         FRtgDOkBHFENxTL5+r2kd25EyNuaZD6/Nbgmpp0HjLYqFYICq6j0ETYFAJvcOfuCHwzB
         K73ASiaVCvF47HUdAy9MSLUJjIZWcaApModsuYag2bJQDLxonlvC+3htVOGzTj+Yo27a
         SAz4IQSM44Jr9mx6/jZ7V3eCdkEl/WTiPAacZxFul1xiHdLHv3Jkjmh9Pjksl3Au+hNh
         xeZQ==
X-Gm-Message-State: AOJu0YzdEODqNy1cThDN1JdhDWvBbXdJiRS86iod/+MQ1BL36hE+EGLs
	QnT0SQy8d6puRzMQKWCU2KFRfebvZs7cnIzZzfQTXjewgXLJNRuKRVleXQIqovCknRrWJhSWMSl
	M2jV4aVZ2uGWumB+FRq2sPs5g1u9AiWmDE5CYX5v6sFg4FIlBnTX8raq2
X-Gm-Gg: ASbGncszH0o16FYBQnrApp4PVukS9u6kC54rbzLTV+SKNvs6du/DIshKcFDwho8MRNy
	zjKhGcoKmv4DdAji+Nz9v9IHAo8arLgFEHvXjfAfeJ/LOhsKZiefh+JoYLZOQoDN7T/d1brJiCQ
	ZAPeosYJZLf0d3PoDmrPBSxYfaqg0h10Kq8nwENZCNvLXW7trkS1K7WA2mDyzJwQOM7RiUWKTzs
	7cDEzSwGdNvrjqaPgdA1d5Nt7Lo8bdDIVVhmRgig1YEA5YbscYokE0hee8Pyqg=
X-Google-Smtp-Source: AGHT+IHAK/qPwgSmSCJLGfBjqQM2vcUyaaK0ElRhJneu5Nk0cEvEXK8xDHWJ+dBfVz1IUtf47kFhuUgyIobaaTUvn30=
X-Received: by 2002:a05:6e02:3710:b0:433:27b5:1faa with SMTP id
 e9e14a558f8ab-43367dca877mr12429685ab.1.1762546421338; Fri, 07 Nov 2025
 12:13:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Justin Forbes <jforbes@fedoraproject.org>
Date: Fri, 7 Nov 2025 13:13:30 -0700
X-Gm-Features: AWmQ_bnxn5ZTxbSrTPWI-CI3rLMS0B7sroSBMNjVbv-EBLTdopH_YiIu0paJ5Co
Message-ID: <CAFxkdArGv91enmUpsuuARGLGZXNJjGZE3Cjsk3NfZS5nCRsgYA@mail.gmail.com>
Subject: Build failure with rust 1.91 and CONFIG_EXTENDED_MODVERSIONS
To: rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

It seems that building withe CONFIG_EXTENDED_MODVERSIONS  and rust
1.91 gets us to the following error:

error: gendwarfksyms: process_module: dwarf_get_units failed: no
debugging information?
make[2]: *** [rust/Makefile:552: rust/bindings.o] Error 1
make[2]: *** Deleting file 'rust/bindings.o'

Turning off CONFIG_EXTENDED_MODVERSIONS gives us a successful build, even with:
CONFIG_BASIC_MODVERSIONS=y
# CONFIG_EXTENDED_MODVERSIONS is not set
CONFIG_MODVERSIONS=y

Justin
